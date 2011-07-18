require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  test "invalid without a student id and/or choice id" do
    assert Vote.new.invalid?
    assert Vote.new(:student_id_number => 12345).invalid?
    assert Vote.new(:choice_id => 12345).invalid?
  end
  
  test "valid with id and choice" do
    assert Vote.new(:student_id_number => 12345, :choice_id => 123).valid?
  end
  
  test "student id can vote thrice" do
    3.times do
      assert Vote.create!(:student_id_number => 12345, :choice_id => 123)
    end
  end
  
  test "student id can't vote four times" do
    3.times do
      assert Vote.create!(:student_id_number => 12345, :choice_id => 123)
    end
    
    assert Vote.new(:student_id_number => 12345, :choice_id => 123).invalid?
  end
  
  test "student id masked for votes" do
    v = Vote.create!(:student_id_number => 300170288, :choice_id => 123)
    assert_equal "xxxxxx288", v.mask
  end
  
end
