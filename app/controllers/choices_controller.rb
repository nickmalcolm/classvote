class ChoicesController < ApplicationController
  
  before_filter :require_student, :only => :vote
  
  def vote
    v = Vote.new(:choice_id => params[:id])
    v.student_id_number = @current_student.to_i
    
    if v.valid?
      v.save!
      flash[:notice] = "Thanks for the vote"
    else
      flash[:error] = "You can't vote anymore"
    end
    redirect_to root_url
  end
  
  # GET /choices
  # GET /choices.xml
  def index
    @choices = Choice.order("votes_count DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @choices }
    end
  end

  # GET /choices/1
  # GET /choices/1.xml
  def show
    @choice = Choice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @choice }
    end
  end

  # GET /choices/new
  # GET /choices/new.xml
  def new
    @choice = Choice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @choice }
    end
  end

  # GET /choices/1/edit
  def edit
    @choice = Choice.find(params[:id])
  end

  # POST /choices
  # POST /choices.xml
  def create
    @choice = Choice.new(params[:choice])

    respond_to do |format|
      if @choice.save
        format.html { redirect_to(@choice, :notice => 'Choice was successfully created.') }
        format.xml  { render :xml => @choice, :status => :created, :location => @choice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /choices/1
  # PUT /choices/1.xml
  def update
    @choice = Choice.find(params[:id])

    respond_to do |format|
      if @choice.update_attributes(params[:choice])
        format.html { redirect_to(@choice, :notice => 'Choice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.xml
  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.html { redirect_to(choices_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def require_student
    unless @current_student.to_i > 0
      flash[:error] = "Log in first bro"
      redirect_to root_path
    end
  end
end
