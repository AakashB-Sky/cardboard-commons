class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.integer :game_id
      t.string :skill_level
      t.integer :host_id
      t.integer :seats_available
      t.integer :seats_total
      t.string :neighborhood
      t.string :street_address
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :description
      t.string :visibility
      t.string :approval_requirement
      t.string :status
      t.integer :rsvps_count

      t.timestamps
    end
  end
end
