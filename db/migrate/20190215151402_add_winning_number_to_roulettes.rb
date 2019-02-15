class AddWinningNumberToRoulettes < ActiveRecord::Migration[5.2]
  def change
    add_column :roulettes, :winning_number, :integer
  end
end
