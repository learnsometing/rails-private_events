# frozen_string_literal: true

require 'test_helper'

class EventCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
  end

  test 'Event should not be created with invalid information' do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_no_difference 'Event.count' do
      post events_path(params: { event: { date: 1.days.ago,
                                             location: '',
                                             description: '' } })
    end
    assert_template 'static_pages/home'
    assert_select 'div#error_explanation'
  end

  test 'Event should be created with valid information' do
    log_in_as(@user)
    get root_path
    assert_difference 'Event.count', 1 do
      post events_path(params: { event: {date: 'July 4th, 2019',
                                            location: "Tom's House",
                                            description: 'Gonna get lit.'}})
    end
    event = assigns(:event)
    assert_redirected_to event
    follow_redirect!
    assert_not flash.empty?
    assert_select 'div.alert-success'
    assert_select 'div.event_info'
    assert_match event.description, response.body
  end
end
