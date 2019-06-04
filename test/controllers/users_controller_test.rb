require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end
end
