class DropGamesUpdateRoulettes < ActiveRecord::Migration[5.2]
  def change
    drop_table :roulettes

    create_table :roulettes do |t|
      t.integer :weather_avg
      t.integer :number_rounds
      t.integer :winning_number

      t.timestamps
    end
  end
end
