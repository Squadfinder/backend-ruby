
require 'rails_helper'

RSpec.describe 'Games API' do
  it 'sends a list of games', :vcr do
    get '/api/v1/search?search=dogs'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    games = JSON.parse(response.body, symbolize_names: true)
    expect(games.count).to eq(20)
    expect(games).to be_a(Array)
    expect(games).to be_all(Hash)

    games.each do |game|
      expect(game).to have_key(:name)
      expect(game[:name]).to be_a String
      expect(game).to have_key(:platforms)
      expect(game[:platforms]).to be_a Array
      expect(game).to have_key(:image)
      expect(game[:image]).to be_a String
      expect(game).to have_key(:genres)
      expect(game[:genres]).to be_a Array
    end
  end
end
