require 'rails_helper'

RSpec.describe RawgSearchService do
  describe '#rawg_service' do
    it 'returns a specific games and its details', :vcr do

      game_id = 4200

      response = RawgSearchService.search_game_id(game_id)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:id)
      expect(response[:id]).to be_a(Integer)
      expect(response).to have_key(:name)
      expect(response[:name]).to be_a(String)
      expect(response).to have_key(:description)
      expect(response[:description]).to be_a(String)
      expect(response).to have_key(:background_image)
      expect(response[:background_image]).to be_a(String)
      expect(response).to have_key(:parent_platforms)
      expect(response[:parent_platforms]).to be_a(Array)
      expect(response[:parent_platforms][0]).to have_key(:platform)
      expect(response[:parent_platforms][0][:platform]).to be_a(Hash)
      expect(response[:parent_platforms][0][:platform]).to have_key(:name)
      expect(response[:parent_platforms][0][:platform][:name]).to be_a(String)
      expect(response).to have_key(:genres)
      expect(response[:genres]).to be_a(Array)
      expect(response[:genres][0]).to have_key(:name)
      expect(response[:genres][0][:name]).to be_a(String)
    end
  end
end