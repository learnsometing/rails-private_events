# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many   :rsvps, foreign_key: 'attended_event_id'
  has_many   :attendees, through: :rsvps, source: :attendee
  default_scope -> { order(date: :asc) }
  scope :prev, -> { where('date < :current_date', current_date: DateTime.now) }
  scope :upcoming, -> { where('date >= :current_date', current_date: DateTime.now) }
  validates :date, presence: true, date: true
  validates :location, presence: true
  validates :description, presence: true
end
