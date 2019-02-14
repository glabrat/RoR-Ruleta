class Roulette < ApplicationRecord
    belongs_to :game, class_name: "game", foreign_key: "game_id"
    has_many :rounds, class_name: "round"
end
