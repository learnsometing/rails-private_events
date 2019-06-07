require 'test_helper'

class RsvpsEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:visenya)
    @other = users(:rhaenys)
    @event = events(:red_carpet_gala)
    @rsvp = rsvps(:visenya)
  end

  test 'should change the accepted attribute of the rsvp' do
    log_in_as(@user)
    get edit_rsvp_path(@rsvp)
    assert_template 'rsvps/edit'
    patch rsvp_path(@rsvp), params: {rsvp: {accepted: 'true'}}
    assert_redirected_to invitations_path
    follow_redirect!
    assert_select 'div.col-md-6', 0
    @rsvp.reload
    assert_equal @rsvp.accepted, true
  end

  test 'should change the declined attribute of the rsvp' do
    log_in_as(@user)
    get edit_rsvp_path(@rsvp)
    assert_template 'rsvps/edit'
    patch rsvp_path(@rsvp), params: {rsvp: {accepted: 'false'}}
    assert_redirected_to invitations_path
    follow_redirect!
    assert_select 'div.col-md-6', 0
    @rsvp.reload
    assert_equal @rsvp.accepted, false
    assert_equal @rsvp.declined, true
  end
end
