# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :rsvps, foreign_key: 'attendee_id'
  has_many :attended_events, through: :rsvps, source: :attended_event

  validates :name, presence: true, length: { minimum: 6, maximum: 140 }
end
