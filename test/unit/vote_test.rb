require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  test "invalid without a student id" do
    assert Vote.new.invalid?
  end
  
  test "valid with id" do
    assert Vote.new(:student_id_number => 12345).valid?
  end
  
end
