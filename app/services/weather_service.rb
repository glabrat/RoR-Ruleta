module WeatherService
    class << self
        def santiago_weather_avg
            require 'open-uri'
            weather_avg = 0
            api_key = Rails.application.credentials.dig(:secret_key_weather_api) #https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/
            doc = Nokogiri::XML(open("http://api.meteored.cl/index.php?api_lang=cl&localidad=18578&affiliate_id=#{api_key}"))
            #Se busca el valor de xml, la temperatura mínima y máxima están en el atributo de la etiqueta
            doc.css('forecast').each do |dc|
                is_integer=Integer(dc["value"]) rescue false 
                if is_integer
                    weather_avg += is_integer
                end
            end
            weather_avg = weather_avg / 14
            weather = Weather.new(weather_avg: weather_avg)
            weather.save!
        end
    end
end