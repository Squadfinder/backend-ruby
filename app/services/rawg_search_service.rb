class RawgSearchService

  def self.connection
    Faraday.new(url: 'https://api.rawg.io')
  end

  def self.search_game_id(game_id)
    response = connection.get("/api/games/#{game_id}") do |f|
      f.params['key'] = ENV['rawg_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_name(name)
   response = connection.get('/api/games') do |req|
     req.params['key'] = ENV['rawg_api_key']
     req.params['search'] = name
     req.params['page_size'] = 20
   end
   data = JSON.parse(response.body, symbolize_names: true)
 end

  def self.get_name_and_genre(name, genres)
   response = connection.get('/api/games') do |req|
     req.params['key'] = ENV['rawg_api_key']
     req.params['search'] = name
     req.params['genres'] = genres
     req.params['page_size'] = 20
   end
   data = JSON.parse(response.body, symbolize_names: true)
 end
end
