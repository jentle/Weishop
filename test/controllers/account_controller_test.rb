require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get updateedit" do
    get :updateedit
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
