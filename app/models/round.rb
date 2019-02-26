class Round < ApplicationRecord
    belongs_to :roulette, class_name: "Roulette"
    belongs_to :player, class_name: "Player"

    def self.all_needed
        find_by_sql("SELECT * FROM rounds 
            INNER JOIN players ON players.id = rounds.player_id
            INNER JOIN roulettes ON roulettes.id = rounds.roulette_id")
    end

    def self.rounds_players
        find_by_sql("SELECT * FROM players INNER JOIN rounds ON players.id = rounds.player_id")
    end
    
end
