class RawgFacade

  def self.get_game(game_id)
    data = RawgSearchService.search_game_id(game_id)
    if data.keys.include?(:detail)
      nil
    else
      Game.new(data)
    end
  end
end