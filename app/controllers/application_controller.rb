class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_student
  
  private
  def set_current_student
    @current_student = session[:student_id_number]
  end
  
end
