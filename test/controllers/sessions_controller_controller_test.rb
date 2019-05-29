require 'test_helper'

class SessionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_controller_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_controller_destroy_url
    assert_response :success
  end

end
