require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "can get new" do
    get :new
    assert_response :success
    assert_nil session[:student_id_number]
  end
  
  test "can post student id to create session" do
    post :create, :student_id_number => 300170288
    assert_redirected_to root_url
    assert_not_nil session[:student_id_number]
  end
  
  test "can destroy session" do
    session[:student_id_number] = 123456
    get :destroy
    assert_nil session[:student_id_number]
  end
  
end
