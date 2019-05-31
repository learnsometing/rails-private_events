class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|

      t.timestamps
      t.references :attended_event, references: :events, foreign_key: true, index: true
      t.references :attendee, references: :users, foreign_key: true, index: true
    end
  end
end
