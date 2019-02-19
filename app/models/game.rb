class Game < ApplicationRecord
    validates :name, presence: true    
    validates :min_players, presence: true
    validates :max_players, presence: true
    validates :min_players, numericality: { less_than_or_equal_to: :max_players, message: "Debe ser menor o mayor que máximo jugadores"}
    has_one :roulettes
end
