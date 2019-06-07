require 'test_helper'

class EventsEditTest < ActionDispatch::IntegrationTest
  def setup
    @creator = users(:rhaenys)
    @attendee1 = users(:visenya)
    @attendee2 = users(:aegon)
    @event = events(:party_at_toms)
  end

  test 'should create rsvps for all the attendees passed in params' do
    log_in_as(@creator)
    get invite_path(id: @event.id)
    patch invite_path(id: @event.id, event: {attendee_ids: [@attendee1.id, 
                                                           @attendee2.id]})
    assert_redirected_to @event
    follow_redirect!
    assert_select  'ol.attendees'
    assert_select  'ol.attendees li', 2
    @event.reload
    assert_equal @event.rsvps.count, 2
  end

end
