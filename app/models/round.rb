class Round < ApplicationRecord
    belongs_to :roulette, class_name: "roulette", foreign_key: "roulette_id"
    has_many :players, class_name: "player"
end
