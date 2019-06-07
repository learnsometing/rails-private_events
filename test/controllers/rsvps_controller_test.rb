require 'test_helper'

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:visenya)
    @other = users(:rhaenys)
    @event = events(:red_carpet_gala)
  end

  test 'should redirect Rsvps#edit if logged out' do
    get edit_rsvp_path(rsvps(:visenya))
    assert_redirected_to login_path
  end

  test 'should redirect Rsvps#edit if not invited' do
    log_in_as(@other)
    get edit_rsvp_path(rsvps(:visenya))
    assert_redirected_to root_url
  end

  test 'should redirect Rsvps#update if logged out' do
    patch rsvp_path(rsvps(:visenya)), params: {accepted: 'true'}
    assert_redirected_to login_path
  end


  test 'should redirect Rsvps#update if not invited' do
    log_in_as(@other)
    patch rsvp_path(rsvps(:visenya)), params: {accepted: 'true'}
    assert_redirected_to root_url
  end
end
