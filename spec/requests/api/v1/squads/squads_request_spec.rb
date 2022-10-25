require 'rails_helper'

describe "Squads API" do
  it 'Can create a squad and a UserSquad -- making the user creating it the host' do
    user_1 = create(:user)
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    user_3 = User.create!(gamertag: 'thomas', platform: 'XBox')
    user_4 = User.create!(gamertag: 'wes', platform: 'XBox')
    create_squad_body = {
      'user': user_1.id,
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

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a Hash
    expect(response_body.keys.count).to eq 1
    expect(response_body.keys).to include(:data)
    expect(response_body[:data]).to be_a Hash
    expect(response_body[:data].keys.count).to eq 3
    expect(response_body[:data].keys).to include(:id, :type, :attributes)
    expect(response_body[:data][:id]).to be_a String    
    expect(response_body[:data][:id]).to eq Squad.last.id.to_s
    expect(response_body[:data][:type]).to be_a String
    expect(response_body[:data][:type]).to eq 'squad'
    # Do we need to update this to include UserSquad members?
    expect(response_body[:data][:attributes]).to be_a Hash
    expect(response_body[:data][:attributes].keys.count).to eq 4
    expect(response_body[:data][:attributes].keys).to include(:game, :event_time, :number_players, :competitive)
    expect(response_body[:data][:attributes][:game]).to be_a String
    expect(response_body[:data][:attributes][:game]).to eq Squad.last.game
    expect(response_body[:data][:attributes][:event_time]).to be_a String
    expect(response_body[:data][:attributes][:number_players]).to be_a Integer
    expect(response_body[:data][:attributes][:number_players]).to eq Squad.last.number_players
    expect(response_body[:data][:attributes][:competitive]).to eq (true || false)
    expect(response_body[:data][:attributes][:competitive]).to eq Squad.last.competitive
  end

  it 'Creates UserSquad association for each member of the squad when a squad is formed' do
    user_1 = create(:user)
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    user_3 = User.create!(gamertag: 'thomas', platform: 'XBox')
    user_4 = User.create!(gamertag: 'wes', platform: 'XBox')

    create_squad_body = {
      'user': user_1.id,
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

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    squads = UserSquad.all

    expect(squads[0].user_id).to eq(user_1.id)
    expect(squads[0].host_id).to eq(user_1.id)
    expect(squads[0].status).to eq("approved")

    expect(squads[1].user_id).to eq(user_2.id)
    expect(squads[1].host_id).to eq(user_1.id)
    expect(squads[1].status).to eq("approved")

    expect(squads[2].user_id).to eq(user_3.id)
    expect(squads[2].host_id).to eq(user_1.id)
    expect(squads[2].status).to eq("approved")

    expect(squads[3].user_id).to eq(user_4.id)
    expect(squads[3].host_id).to eq(user_1.id)
    expect(squads[3].status).to eq("approved")
  end

  it 'returns an error if squad was not created' do
    user_1 = User.create!(gamertag: "mike", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    user_3 = User.create!(gamertag: 'thomas', platform: 'XBox')
    user_4 = User.create!(gamertag: 'wes', platform: 'XBox')

    create_squad_body = {}

    post api_v1_squads_path(create_squad_body)

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.keys).to include(:description)
    expect(result[:description]).to eq "Error: Squad Not Created"
  end
end