class CreateRoulettes < ActiveRecord::Migration[5.2]
  def change
    create_table :roulettes do |t|
      t.integer :game_id
      t.integer :weather_avg

      t.timestamps
    end
  end
end
