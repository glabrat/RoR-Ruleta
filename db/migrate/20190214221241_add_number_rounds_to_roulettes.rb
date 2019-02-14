class AddNumberRoundsToRoulettes < ActiveRecord::Migration[5.2]
  def change
    add_column :roulettes, :number_rounds, :integer
  end
end
