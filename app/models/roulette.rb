class Roulette < ApplicationRecord
    belongs_to :game
    has_many :rounds, class_name: "round"
end
