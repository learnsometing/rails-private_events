require 'test_helper'

class EventsShowTest < ActionDispatch::IntegrationTest
  def setup
    @event = events(:party_at_toms)
  end
end
