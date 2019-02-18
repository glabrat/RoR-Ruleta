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

        if black.include?(number)
            return 'black'
        elsif red.include?(number)
            return 'red'
        else
            return 'green'
        end
    end

    def random_player_bet(money)
        bet = @weather > 20? rand(3..7) : rand(8..15)
        return (money / 100) * bet
    end

    def get_weather
        require 'uri'
        require 'net/http'
        api_key = Rails.application.credentials.dig(:secret_key_weather_api) #https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/
        uri = URI("http://api.meteored.cl/index.php?api_lang=cl&localidad=18578&affiliate_id=#{api_key}")
        Net::HTTP.post_form(uri ,{}).body
    end

end