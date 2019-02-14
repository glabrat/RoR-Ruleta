# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.create({name: 'Bot 1', money: 10000})
Game.create({name: 'Ruleta 1', min_players: 4, max_players: 8, time_rounds: 180})