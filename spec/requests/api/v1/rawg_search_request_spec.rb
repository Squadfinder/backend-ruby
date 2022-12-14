
require 'rails_helper'

RSpec.describe 'Games API' do
  it 'sends a list of games', :vcr do
    info = {
      "search": "call of duty",
      "genres": ""
    }

    get api_v1_search_index_path(info)

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
      expect(game).to have_key(:game_id)
      expect(game[:game_id]).to be_a Integer
    end
  end
  it 'sends a list of games with genres included', :vcr do
    info = {
      "search": "dog",
      "genres": "shooter"
    }

    get api_v1_search_index_path(info)

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
      expect(game).to have_key(:game_id)
      expect(game[:game_id]).to be_a Integer
    end
  end
  describe 'Games Search sad path', :vcr do
    it "is able to test for sad path in search" do
      info = {
        "search": "sndfbsdf",
        "genres": "sdfvsdj vlskd"
      }

      get api_v1_search_index_path(info)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      games = JSON.parse(response.body, symbolize_names: true)

      expect(games).to eq([])
    end
    it "is able to test for sad path in search with no genres" do
      info = {
        "search": "sndftrgrtrvbsdf"
      }

      get api_v1_search_index_path(info)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      games = JSON.parse(response.body, symbolize_names: true)

      expect(games).to eq([])
    end
  end
end
