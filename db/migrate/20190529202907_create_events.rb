class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string     :location
      t.string     :date
      t.string     :description
      t.references :creator, references: :users
    end
  end
end
