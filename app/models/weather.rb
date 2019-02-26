class Weather < ApplicationRecord
    def self.week_avg
        weather_avg = Weather.where("created_at >= ?", Time.zone.now.beginning_of_day)
        if weather_avg.exists? 
            return weather_avg.pluck(:weather_avg)[0]
        else
            WeatherService.santiago_weather_avg
            weather_avg = Weather.where("created_at >= ?", Time.zone.now.beginning_of_day)
            return weather_avg.pluck(:weather_avg)[0]
        end
    end
end
