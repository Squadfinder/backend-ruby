require 'rails_helper'

describe "Users API" do
  it 'Can create a squad and a UserSquad -- making the user creating it the host' do
    user_1 = create(:user)

    create_squad_body = {
      'user': user_1.id,
      'game':  Faker::Game.title,
      'event_time': Faker::Time.forward(days: 5),
      'number_players': 3,
      'competitive': true
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
    # expect(response_body[:data][:attributes][:event_time]).to eq Squad.last.event_time

    expect(response_body[:data][:attributes][:number_players]).to be_a Integer
    expect(response_body[:data][:attributes][:number_players]).to eq Squad.last.number_players

    expect(response_body[:data][:attributes][:competitive]).to eq (true || false)
    expect(response_body[:data][:attributes][:competitive]).to eq Squad.last.competitive

    expect(UserSquad.last.user).to eq user_1
  end
end