class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :player_money
      t.integer :player_bet
      t.integer :player_id
      t.integer :roulette_id

      t.timestamps
    end
  end
end
