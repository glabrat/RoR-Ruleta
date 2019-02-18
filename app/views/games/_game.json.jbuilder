json.extract! game, :id, :name, :min_players, :max_players, :time_rounds, :auto_play, :created_at, :updated_at
json.url game_url(game, format: :json)
