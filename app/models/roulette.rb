class Roulette < ApplicationRecord
    has_many :rounds, class_name: "Round"
    has_many :players, :through => :rounds
end
