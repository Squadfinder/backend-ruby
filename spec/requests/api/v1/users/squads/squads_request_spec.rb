require 'rails_helper'

describe 'UserSquads API' do
  it 'Can return an index of UserSquads' do
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

    get api_v1_user_squads_path(user)

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

  it 'Can create a new UserSquad when given a host and a squad with the status as pending' do
    host_user = create(:user)
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    user_3 = User.create!(gamertag: 'thomas', platform: 'XBox')
    user_4 = User.create!(gamertag: 'wes', platform: 'XBox')

    create_squad_body = {
      'user': host_user.id,
      'game':  Faker::Game.title,
      'event_time': Faker::Time.forward(days: 5),
      'number_players': 3,
      'competitive': true,
      'squadMembers': [
      user_2,
      user_3,
      user_4
    ]
    }

    post api_v1_squads_path(create_squad_body)

    invited_user = create(:user)

    input_body = {
      'host_id': host_user.id,
      'squad_id': Squad.last.id
    }

    post api_v1_user_squads_path(invited_user, input_body)

    expect(response).to be_successful
    expect(response.status).to eq 201

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a Hash
    expect(response_body.keys.count).to eq 7
    expect(response_body.keys).to include(:id, :user_id, :squad_id, :host_id, :status, :created_at, :updated_at)

    expect(response_body[:user_id]).to be_a Integer
    expect(response_body[:user_id]).to eq invited_user.id

    expect(response_body[:squad_id]).to be_a Integer
    expect(response_body[:squad_id]).to eq Squad.last.id

    expect(response_body[:host_id]).to be_a Integer
    expect(response_body[:host_id]).to eq host_user.id

    expect(response_body[:status]).to be_a String
    expect(response_body[:status]).to eq 'pending'

    expect(response_body[:created_at]).to be_a String
    expect(response_body[:updated_at]).to be_a String
  end
end