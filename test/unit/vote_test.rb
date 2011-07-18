require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  test "invalid without a student id and/or choice id" do
    v = Vote.new
    assert v.invalid?
    
    v.student_id_number = 12345
    assert v.invalid?
    
    assert Vote.new(:choice_id => 12345).invalid?
  end
  
  test "valid with id and choice" do
    v = Vote.new(:choice_id => 123)
    v.student_id_number = 12345
    assert v.valid?
  end
  
  test "student id can vote thrice" do
    assert_difference "Vote.count", 3 do
      3.times do
        v = Vote.new(:choice_id => 123)
        v.student_id_number = 1234
        v.save!
      end
    end
  end
  
  test "student id can't vote four times" do
    3.times do
      v = Vote.new(:choice_id => 123)
      v.student_id_number = 1234
      v.save!
    end
    
    v = Vote.new(:choice_id => 123)
    v.student_id_number = 1234
    assert v.invalid?
  end
  
  test "student id masked for votes" do
    v = Vote.new(:choice_id => 123)
    v.student_id_number = 300170288
    v.save!
    assert_equal "xxxxxx288", v.mask
  end
  
end
