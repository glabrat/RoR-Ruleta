class AddAutoPlayToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :auto_play, :boolean
  end
end
