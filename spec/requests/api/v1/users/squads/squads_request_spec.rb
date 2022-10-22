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
    
    expect(result).to be_a Hash
    expect(result.keys.count).to eq 1
    expect(result.keys).to include(:data)

    expect(result[:data]).to be_a Array

    result[:data].each do |user_squad|
      expect(user_squad).to be_a Hash
      expect(user_squad.keys.count).to eq 3
      expect(user_squad.keys).to include(:id, :type, :attributes)

      expect(user_squad[:id]).to be_a String

      expect(user_squad[:type]).to be_a String
      expect(user_squad[:type]).to eq 'user_squad'

      expect(user_squad[:attributes]).to be_a Hash
      expect(user_squad[:attributes].keys.count).to eq 1
      expect(user_squad[:attributes].keys).to include(:squad)

      expect(user_squad[:attributes][:squad]).to be_a Hash
      expect(user_squad[:attributes][:squad].keys.count).to eq 5
      expect(user_squad[:attributes][:squad].keys).to include(:game, :event_time, :number_players, :competitive, :members)

      expect(user_squad[:attributes][:squad][:game]).to be_a String
      expect(user_squad[:attributes][:squad][:event_time]).to be_a String
      expect(user_squad[:attributes][:squad][:number_players]).to be_a Integer
      # expect(user_squad[:attributes][:squad][:competitive]).to be_a Boolean
      
      expect(user_squad[:attributes][:squad][:members]).to be_a Array
      user_squad[:attributes][:squad][:members].each do |member|
        expect(member).to be_a Hash
        expect(member.keys.count).to eq 5
        expect(member.keys).to include(:id, :gamertag, :platform, :created_at, :updated_at)

        expect(member[:id]).to be_a Integer
        expect(member[:gamertag]).to be_a String
        expect(member[:platform]).to be_a String
        expect(member[:created_at]).to be_a String
        expect(member[:updated_at]).to be_a String
      end
    end
  end

  it 'Returns an error if a User does not exist with the given ID' do

    get api_v1_user_squads_path(9001)

    expect(response).to_not be_successful
    expect(response.status).to eq 404

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.keys).to include(:description)
    expect(result[:description]).to eq 'Error: User not found'
  end

  it 'Can delete UserSquad association' do
    user_1 = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    user_3 = User.create!(gamertag: "bad", platform: "xbox")
    rocket = Squad.create!(game: 'Rocket League', event_time: Time.now, competitive: 'true')
    rocket_squad_user_1 = UserSquad.create!(user_id: user_1.id, squad_id: rocket.id, host_id: user_1.id)
    rocket_squad_user_2 = UserSquad.create!(user_id: user_2.id, squad_id: rocket.id, host_id: user_1.id)
    rocket_squad_user_3 = UserSquad.create!(user_id: user_3.id, squad_id: rocket.id, host_id: user_1.id)

    delete api_v1_user_squad_path(user_2.id, rocket_squad_user_2.id)

    expect(user_1.user_squads.count).to eq(1)
    expect(user_2.user_squads.count).to eq(0)
    expect(user_3.user_squads.count).to eq(1)
  end

  it 'Renders an error if no UserSquad exists with an ID when deleting' do
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")
    delete api_v1_user_squad_path(user_2.id, 9001)

    expect(response).to_not be_successful
    expect(response.status).to eq 404

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.keys).to include(:description)
    expect(result[:description]).to eq 'Error: UserSquad not found'
  end
end
