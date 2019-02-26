class RemoveWeatherAvgColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :roulettes, :weather_avg
  end
end
