require 'rails_helper'

RSpec.describe 'RawgSearchFacade' do
  it 'returns instances of games', :vcr do
    games = RawgSearchFacade.get_name('call of duty')
    expect(games).to be_a(Array)
    expect(games.length).to eq(20)
  end

end
