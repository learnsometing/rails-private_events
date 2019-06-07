require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
    @other = users(:visenya)
    @event = events(:party_at_toms)
  end

  test 'should be redirected when creating an event while logged out' do
    post events_path(params: {event: {location: "Tom's place", date: Time.now,
                                       description: 'Gonna be fun'}})
    assert_redirected_to login_path
  end

  test 'should redirect Events#edit if logged out' do
    get invite_path(id: @event.id)
    assert_redirected_to login_path
  end

  test 'should redirect Events#update if logged out' do
    patch invite_path(id: @event.id), 
                      params: {event: {location: 'My party now',
                                       date: 3.months.ago, 
                                       description: 'Jacked your event!'}}
    assert_redirected_to login_path
  end

  test 'should redirect Events#edit unless user is event creator' do
    log_in_as(@other)
    get invite_path(id: @event.id)
    assert_redirected_to root_path
  end

  test 'should redirect Events#update unless user is event creator' do
    log_in_as(@other)
    patch invite_path(id: @event.id), 
                      params: {event: {location: 'My party now',
                                       date: 3.months.ago, 
                                       description: 'Jacked your event!'}}
    assert_redirected_to root_url
  end
end
