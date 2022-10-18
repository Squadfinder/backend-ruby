require 'rails_helper'

describe "Users API" do
  it 'Can return a list of all Users' do
    create_list(:user, 5)

    get api_v1_users_path

    expect(response).to be_successful

    all_users = JSON.parse(response.body, symbolize_names: true)
    
    expect(all_users).to be_a Hash

    all_users[:data].each do |user|
      expect(user).to have_key(:id)
      expect(user[:id]).to be_a String

      expect(user).to have_key(:type)
      expect(user[:type]).to be_a String
      expect(user[:type]).to eq 'user'

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_a Hash

      # Update when we have gamesList in here
      expect(user[:attributes].keys.count).to eq 2
      expect(user[:attributes].keys).to include(:gamertag, :platform)
      # expect(user[:attributes].keys.count).to eq 3
      # expect(user[:attributes].keys).to include(:gamertag, :platform, :games_list)

      expect(user[:attributes][:gamertag]).to be_a String
      expect(user[:attributes][:gamertag]).to eq User.find(user[:id]).gamertag

      expect(user[:attributes][:platform]).to be_a String
      expect(user[:attributes][:platform]).to eq User.find(user[:id]).platform

      # expect(user[:attributes][:games_list]).to be_a Array
      # expect(user[:attributes][:games_list]).to eq User.find(user[:id]).games_list
    end
  end

  it 'Can return data for a specific User' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    usergame1 = UserGame.create!(user_id: user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame2 = UserGame.create!(user_id: user.id, game_id: 2387, image_url: "www.pic.com/image.img", game_title: "Squad")
    usergame3 = UserGame.create!(user_id: user.id, game_id: 2323, image_url: "www.pic.com/image.img", game_title: "Scorn")
    usergame4 = UserGame.create!(user_id: user.id, game_id: 2356, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")

    get api_v1_user_path(user)

    result = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(response).to be_successful

    expect(result).to have_key(:id)
    expect(result[:id]).to be_a(String)
    expect(result[:type]).to eq("user")
    expect(result[:attributes]).to have_key(:gamertag)
    expect(result[:attributes][:gamertag]).to be_a(String)
    expect(result[:attributes]).to have_key(:platform)
    expect(result[:attributes][:platform]).to be_a(String)
  end
end
