class AddAcceptedToRsvps < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :accepted, :boolean, default: false
    add_column :rsvps, :declined, :boolean, default: false
  end
end
