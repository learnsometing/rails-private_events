# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string     :location
      t.datetime   :date
      t.string     :description
      t.integer    :creator_id
    end

    add_foreign_key :events,
                    :users,
                    column: :creator_id

    add_index :events, :creator_id
  end
end
