require 'test_helper'

class ChoicesControllerTest < ActionController::TestCase
  setup do
    @choice = choices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:choices)
  end
  
  test "should have vote button when logged in" do
    login
    get :index
    assert_select "#vote_#{@choice.id}"
  end
  
  test "index should show no votes" do
    get :index
    assert_select "#choice_#{@choice.id} h2", "0"
  end
  
  test "index should show some votes" do
    Vote.create!(:student_id_number => 12345, :choice_id => @choice.id)
    
    get :index
    assert_select "#choice_#{@choice.id} h2", "1"
  end
  
  test "shouldn't have vote button when not logged in" do
    get :index
    assert_select "#vote_#{@choice.id}", 0
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create choice" do
    assert_difference('Choice.count') do
      post :create, :choice => @choice.attributes
    end

    assert_redirected_to choice_path(assigns(:choice))
  end

  test "should show choice" do
    get :show, :id => @choice.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @choice.to_param
    assert_response :success
  end

  test "should update choice" do
    put :update, :id => @choice.to_param, :choice => @choice.attributes
    assert_redirected_to choice_path(assigns(:choice))
  end
  
  test "can vote on a choice if logged in" do
    login
    assert_difference "Vote.count", 1 do
      get :vote, :id => @choice.id
    end
  end


end
