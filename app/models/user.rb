# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6, maximum: 140 }
end
