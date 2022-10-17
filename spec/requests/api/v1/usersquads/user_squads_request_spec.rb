require 'rails_helper'

describe 'UserSquads API' do
  it 'UserSquads Index' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    halo = Squad.create!(game: 'Halo', event_time: Time.now, competitive: 'true')
    rocket = Squad.create!(game: 'Rocket League', event_time: Time.now, competitive: 'true')
    league = Squad.create!(game: 'LOL', event_time: Time.now, competitive: 'true')
    halo_squad = UserSquad.create!(user_id: user.id, squad_id: halo.id, host_id: user.id)
    rocket_squad = UserSquad.create!(user_id: user.id, squad_id: rocket.id, host_id: user.id)
    league_squad = UserSquad.create!(user_id: user.id, squad_id: league.id, host_id: user_2.id)

    get  api_v1_user_usersquads_path(user)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
  end
end