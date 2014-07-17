require 'test_helper'

class ConfirmationsControllerTest < ActionController::TestCase
  test "should get show_success" do
    get :show_success
    assert_response :success
  end

end
