class RouletteGame

    def initialize

    end

    def player_bet
        @player_bet = rand(37)
    end

    def spin
        @number_roulette = rand(37)
    end

    def odd_even?(number)
        if number == 37
            return '0'
        elsif number.odd?
            return 'odd'
        else
            return 'even'
        end
    end

    def show_number_roulette
        return @number_roulette
    end

    def show_number_roulette_color
        return number_to_color(@number_roulette)
    end

    def show_player_bet
        return @player_bet 
    end

    def show_player_bet_color
        return number_to_color(@player_bet)
    end

    def number_to_color(number)
        black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35]
        red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]
        #roulette
        if black.include?(number)
            return 'black'
        elsif red.include?(number)
            return 'red'
        else
            return 'green'
        end
    end

    def random_player_bet(money)
        @weather_avg ||= self.get_weather
        bet = @weather_avg > 20? rand(3..7) : rand(8..15)
        money_bet = (money / 100) * bet
        return money_bet
    end

    def set_weather_avg(weather_avg)
        @weather_avg = weather_avg
    end

    def win_lose(number_roulette, player_bet, player_money_bet)
        roulette_color = self.number_to_color(number_roulette)
        player_color = self.number_to_color(player_bet)
        multiplier = 0
        if roulette_color == player_color 
            if roulette_color == 'green'
                multiplier = 15
            else
                multiplier = 2
            end
            else
                multiplier = -1
        end
        return player_money_bet * multiplier
    end

    def get_weather_avg
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
        #Se divide tempmin1..tempmin + tempmax1..tempmaxn / n * 2
        @weather_avg = weather_avg / 14
        return @weather_avg
    end

end