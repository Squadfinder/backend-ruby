require 'rails_helper'

RSpec.describe 'RawgSearchFacade', :vcr do
  it 'returns instances of games' do
    games = RawgSearchFacade.get_name('call of duty')
    expect(games).to be_a(Array)
    expect(games.length).to eq(20)
  end
  it 'returns instances of games with genres params' do
    games = RawgSearchFacade.get_name_and_genre('dogs', 'shooter')
    expect(games).to be_a(Array)
    expect(games.length).to eq(20)
  end

end
