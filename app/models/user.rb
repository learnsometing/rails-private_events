# frozen_string_literal: true

class User < ApplicationRecord
  include ApplicationHelper

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :rsvps, foreign_key: 'attendee_id'
  has_many :attended_events, through: :rsvps, source: :attended_event
  validates :name, presence: true, length: { minimum: 6, maximum: 140 }

  # Get the events associated with a user that occured prior to the current
  # moment in time.
  def previous_events
    attended_events.where('date < :current_date AND accepted',
                          current_date: DateTime.now)
  end

  # Get the events associated with a user that will occuer after the current
  # moment in time.
  def upcoming_events
    attended_events.where('date >= :current_date AND accepted',
                          current_date: DateTime.now)
  end
end
