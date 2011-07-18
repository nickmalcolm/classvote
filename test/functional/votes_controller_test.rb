require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  
  test "can create a vote when logged in" do
    login
    assert_difference "Vote.count", 1 do
      post :create, :vote => {:student_id_number => 12345}
    end
  end
  
end
