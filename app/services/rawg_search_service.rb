class RawgSearchService
  def self.get_name(name)
   response = connection.get('/api/games') do |req|
     req.params['key'] = ENV['rug_api_key']
     req.params['search'] = name
     req.params['page_size'] = 20
   end
   data = JSON.parse(response.body, symbolize_names: true)
 end

 def self.connection
   Faraday.new(url: 'https://api.rawg.io')
 end

end
