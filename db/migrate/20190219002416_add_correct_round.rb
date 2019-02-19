class AddCorrectRound < ActiveRecord::Migration[5.2]
  def change
    drop_table :rounds

    create_table :rounds do |t|
      t.belongs_to :player, index: true
      t.belongs_to :roulette, index: true
      t.integer :player_money
      t.integer :player_money_bet
      t.integer :player_bet
      t.integer :player_final_money

      t.timestamps
    end
  end
end
