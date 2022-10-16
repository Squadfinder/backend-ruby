require 'rails_helper'

RSpec.describe RawgFacade do
  it 'returns a specific games details', :vcr do

    game = RawgFacade.get_game(4200)

    expect(game).to be_a(Game)
    expect(game.id).to eq(4200)
    expect(game.name).to eq("Portal 2")
    expect(game.background_image).to eq("https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg")
    expect(game.genres).to be_a(Array)
    expect(game.parent_platforms).to be_a(Array)
  end
end