require 'rails_helper'

RSpec.describe RawgFacade do
  it 'returns a specific games details', :vcr do

    game = RawgFacade.get_game(4200)

    expect(game).to be_a(Hash)
  end
end