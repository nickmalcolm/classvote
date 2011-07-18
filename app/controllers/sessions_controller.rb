class SessionsController < ApplicationController
  
  def new
    unless session[:student_id_number].nil?
      redirect_to root_url
    end
  end
  
  def create
    cookie_session params[:session][:student_id_number]
    redirect_to root_url
  end
  
  def destroy
    cookie_session nil
    redirect_to root_url
  end
  
  private 
  def cookie_session(student_id_number)
    cookies[:student_id_number] = student_id_number
    session[:student_id_number] = student_id_number
  end
  
end