require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  test "invalid without a student id" do
    assert Vote.new.invalid?
  end
  
  test "valid with id" do
    assert Vote.new(:student_id_number => 12345).valid?
  end
  
  test "student id can vote thrice" do
    3.times do
      assert Vote.create!(:student_id_number => 12345)
    end
  end
  
  test "student id can't vote four times" do
    3.times do
      assert Vote.create!(:student_id_number => 12345)
    end
    
    assert Vote.new(:student_id_number => 12345).invalid?
  end
  
end
