class CreateEventRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :event_registrations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
