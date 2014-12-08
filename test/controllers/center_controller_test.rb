require 'test_helper'

class CenterControllerTest < ActionController::TestCase
  test "should get service" do
    get :service
    assert_response :success
  end

end
