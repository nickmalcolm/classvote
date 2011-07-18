class VotesController < ApplicationController
  
  def create
    v = Vote.new(:student_id_number => current_student, :choice_id => params[:vote][:choice_id])
    
    if v.valid?
      v.save!
    end
    redirect_to root_url
  end
  
  private
  def current_student
    session[:student_id_number]
  end
  
end
