require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should be redirected to login when trying to access new if logged out" do
    get new_event_path
    assert_redirected_to login_url
  end
end
