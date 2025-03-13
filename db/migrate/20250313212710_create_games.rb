class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :image
      t.string :title
      t.string :genre
      t.string :complexity
      t.string :randomness
      t.string :min_players
      t.string :max_players
      t.string :duration
      t.string :rating
      t.string :website
      t.integer :events_count

      t.timestamps
    end
  end
end
