class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|

      t.timestamps
      t.integer :attended_event_id
      t.integer :attendee_id
    end

    add_foreign_key :rsvps, 
                    :events, 
                    column: :attended_event_id

    add_index :rsvps, :attended_event_id

    add_foreign_key :rsvps, 
                    :events, 
                    column: :attendee_id

    add_index :rsvps, :attendee_id
  end
end
