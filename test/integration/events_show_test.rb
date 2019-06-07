require 'test_helper'

class EventsShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
    @other = users(:visenya)
    @event = events(:party_at_toms)
  end

  test 'should allow the creator to invite others to an event' do
    log_in_as(@user)
    get event_path(@event)
    assert_template 'events/show'
    assert_select 'a[href=?]', invite_path(id: @event.id)
  end

  test 'should not allow attendees to invite others to an event' do
    log_in_as(@other)
    get event_path(@event)
    assert_select 'a[href=?]', invite_path(id: @event.id), 0
  end
end
