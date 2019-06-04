# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string     :location
      t.datetime   :date
      t.string     :description
      t.references :creator, foreign_key: true, index: true
    end
  end
end
