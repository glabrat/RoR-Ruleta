class AddIndexWeather < ActiveRecord::Migration[5.2]
  def change
    add_index :weathers, :created_at
  end
end
