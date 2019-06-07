require 'test_helper'

class EventsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
  end

  test 'index shows pagination' do
    get events_path
    assert_template 'events/index'
    assert_select 'div.container'
    assert_select 'h1', text: 'Upcoming Events'
    assert_select 'div.events'
    assert_match @user.events.count.to_s, response.body
    @user.upcoming_events.paginate(page: 1).each do |event|
      assert_select 'a[href=?]', event_path(event)  , event.location
    end
  end
end
