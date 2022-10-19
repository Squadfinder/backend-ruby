class RawgSearchSerializer
  def self.format_games(games)
    games.map do |game|
      {
        game_id: game.game_id,
        name: game.name,
        platforms: game.platforms,
        image: game.image,
        genres: game.genres,
      }
    end
  end
end
