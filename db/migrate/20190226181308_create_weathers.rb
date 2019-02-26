class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.integer :weather_avg

      t.timestamps
    end
  end
end
