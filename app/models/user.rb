# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  validates :name, presence: true, length: { minimum: 6, maximum: 140 }
end
