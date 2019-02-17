class RouletteGame

    attr_accessor :number_roulette, :player_bet

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
        black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33,35]
        red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34,36]

        if black.include?(number)
            return 'black'
        elsif red.include?(number)
            return 'red'
        else
            return 'green'
        end
    end

end