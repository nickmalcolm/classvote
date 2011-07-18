class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    cookie_session params[:student_id_number]
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