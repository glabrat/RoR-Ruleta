class Player < ApplicationRecord
    has_many :rounds
    has_many :roulettes, :through => :rounds
end
