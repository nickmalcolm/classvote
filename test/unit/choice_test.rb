require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  
  test "cant have blank choice" do
    assert Choice.new.invalid?
  end
  
  test "choice needs title" do
    assert Choice.new(:title => "").invalid?
    assert Choice.new(:title => "Abc").valid?
  end
end
