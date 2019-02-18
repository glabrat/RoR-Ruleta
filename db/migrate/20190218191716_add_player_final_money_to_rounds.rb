class AddPlayerFinalMoneyToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :player_final_money, :integer
  end
end
