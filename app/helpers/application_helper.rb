module ApplicationHelper
    def number_to_pesos(number)
        number_to_currency(number, :unit => "$ ", :delimiter => ".", :precision => 0 )
    end
    def number_to_color(number)
        black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35]
        red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]

        if black.include?(number)
            return 'negro'
        elsif red.include?(number)
            return 'rojo'
        else
            return 'verde'
        end
    end
    #Weird thing may work
    def win_lose_money(player_money, final_player_money)
        final_player_money - player_money
    end
    def win_lose_money_color(player_money, final_player_money)
        total = self.win_lose_money(player_money, final_player_money)
        if total < 0
            return 'rojo'
        elsif total == 0
            return 'negro'
        else
            return 'verde'
        end
    end
end
