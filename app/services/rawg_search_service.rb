class RawgSearchService 

  def self.connection
    Faraday.new(url: 'https://api.rawg.io')
  end

  def self.search_game_id(game_id)
    response = connection.get("https://api.rawg.io/api/games/#{game_id}") do |f|
      f.params['key'] = ENV['rawg_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end