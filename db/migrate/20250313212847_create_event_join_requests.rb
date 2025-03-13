class CreateEventJoinRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :event_join_requests do |t|
      t.integer :event_id
      t.integer :guest_id
      t.string :status

      t.timestamps
    end
  end
end
