class Round < ApplicationRecord
    belongs_to :roulette
    belongs_to :player

    def self.allneeded
        Round.includes(:player, :roulette)
    end
    
end
