require 'rails_helper'

describe 'UserSquads API' do
  it 'UserSquads Index' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    halo = Squad.create!(game: 'Halo', event_time: Time.now, competitive: 'true')
    rocket = Squad.create!(game: 'Rocket League', event_time: Time.now, competitive: 'true')
    league = Squad.create!(game: 'LOL', event_time: Time.now, competitive: 'true')
    wow = Squad.create!(game: 'WOW', event_time: Time.now, competitive: 'true')
    halo_squad = UserSquad.create!(user_id: user.id, squad_id: halo.id, host_id: user.id)
    rocket_squad = UserSquad.create!(user_id: user.id, squad_id: rocket.id, host_id: user.id)
    league_squad = UserSquad.create!(user_id: user.id, squad_id: league.id, host_id: user_2.id)
    wow_squad = UserSquad.create!(user_id: user_2.id, squad_id: wow.id, host_id: user_2.id)

    get  api_v1_user_squads_path(user)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(result[0]).to have_key(:id)
    expect(result[0][:id]).to be_a(Integer)
    expect(result[0]).to have_key(:user_id)
    expect(result[0][:user_id]).to be_a(Integer)
    expect(result[0]).to have_key(:squad_id)
    expect(result[0][:squad_id]).to be_a(Integer)
    expect(result[0]).to have_key(:host_id)
    expect(result[0][:host_id]).to be_a(Integer)
    expect(result[0]).to have_key(:status)
    expect(result[0][:status]).to be_a(String)
    expect(result[0]).to have_key(:created_at)
    expect(result[0][:created_at]).to be_a(String)
    expect(result[0]).to have_key(:updated_at)
    expect(result[0][:updated_at]).to be_a(String)
  end
end