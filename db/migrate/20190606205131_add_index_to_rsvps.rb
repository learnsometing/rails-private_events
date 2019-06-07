class AddIndexToRsvps < ActiveRecord::Migration[5.2]
  def change
      add_index :rsvps, [:attended_event_id, :attendee_id], unique: true
  end
end
