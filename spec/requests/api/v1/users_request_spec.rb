require 'rails_helper'

describe "Users API" do
  it 'Can return a list of all Users' do
    create_list(:user, 5)
    usergame1 = UserGame.create!(user_id: User.first.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame2 = UserGame.create!(user_id: User.second.id, game_id: 2387, image_url: "www.pic.com/image.img", game_title: "Squad")
    usergame3 = UserGame.create!(user_id: User.third.id, game_id: 2323, image_url: "www.pic.com/image.img", game_title: "Scorn")
    usergame4 = UserGame.create!(user_id: User.fourth.id, game_id: 2356, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")
    usergame5 = UserGame.create!(user_id: User.fifth.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame6 = UserGame.create!(user_id: User.first.id, game_id: 1234, image_url: "www.pic.com/image.img", game_title: "bing bong")

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

      expect(user[:attributes].keys.count).to eq 3
      expect(user[:attributes].keys).to include(:gamertag, :platform, :user_games)

      expect(user[:attributes][:gamertag]).to be_a String
      expect(user[:attributes][:gamertag]).to eq User.find(user[:id]).gamertag

      expect(user[:attributes][:platform]).to be_a String
      expect(user[:attributes][:platform]).to eq User.find(user[:id]).platform

      expect(user[:attributes][:user_games]).to be_a Array

      expect(user[:attributes][:user_games].count).to eq User.find_by_id(user[:id]).user_games.count

      user[:attributes][:user_games].each do |user_game|
        expect(user_game).to be_a Hash
        expect(user_game.keys.count).to eq 7
        expect(user_game.keys).to include(:id, :user_id, :game_id, :image_url, :game_title, :created_at, :updated_at)

        expect(user_game[:id]).to be_a Integer
        expect(user_game[:user_id]).to be_a Integer
        expect(user_game[:game_id]).to be_a Integer
        expect(user_game[:image_url]).to be_a String
        expect(user_game[:game_title]).to be_a String
        expect(user_game[:created_at]).to be_a String
        expect(user_game[:updated_at]).to be_a String
      end
    end
  end

  it 'Can return data for a specific User' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    usergame1 = UserGame.create!(user_id: user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame2 = UserGame.create!(user_id: user.id, game_id: 2387, image_url: "www.pic.com/image.img", game_title: "Squad")
    usergame3 = UserGame.create!(user_id: user.id, game_id: 2323, image_url: "www.pic.com/image.img", game_title: "Scorn")
    usergame4 = UserGame.create!(user_id: user.id, game_id: 2356, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")

    get api_v1_user_path(user)

    result = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(response).to be_successful

    expect(result).to have_key(:gamertag)
    expect(result[:gamertag]).to be_a(String)
    expect(result).to have_key(:platform)
    expect(result[:platform]).to be_a(String)
    expect(result).to have_key(:user_games)
    expect(result[:user_games]).to be_a(Array)
    expect(result[:user_games].count).to eq(4)
    expect(result[:user_games][0]).to have_key(:game_id)
    expect(result[:user_games][0][:game_id]).to be_a(Integer)
    expect(result[:user_games][0]).to have_key(:game_title)
    expect(result[:user_games][0][:game_title]).to be_a(String)
    expect(result[:user_games][0]).to have_key(:image_url)
    expect(result[:user_games][0][:image_url]).to be_a(String)
  end
end
