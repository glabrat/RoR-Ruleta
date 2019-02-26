class Player < ApplicationRecord
    has_many :rounds, class_name: "Round"
    has_many :roulettes, :through => :rounds

    def self.player_rounds
        find_by_sql("SELECT * FROM players INNER JOIN rounds ON players.id = rounds.player_id")
    end
end
