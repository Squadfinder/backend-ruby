require 'rails_helper'

describe "Game Users API" do
  it 'Can return a list of all Users who own a game', :vcr do
    create_list(:user, 5)
    usergame1 = UserGame.create!(user_id: User.first.id, game_id: 58751, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame2 = UserGame.create!(user_id: User.second.id, game_id: 58751, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame3 = UserGame.create!(user_id: User.third.id, game_id: 58751, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame4 = UserGame.create!(user_id: User.fourth.id, game_id: 3272, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")
    usergame5 = UserGame.create!(user_id: User.fifth.id, game_id: 23598, image_url: "www.pic.com/image.img", game_title: "League of Legends")
    usergame6 = UserGame.create!(user_id: User.first.id, game_id: 23598, image_url: "www.pic.com/image.img", game_title: "League of Legends")

    get api_v1_game_users_path(58751)

    expect(response).to be_successful

    all_users = JSON.parse(response.body, symbolize_names: true)

    possible_ids = [ User.first.id, User.second.id, User.third.id]
    contained_ids = all_users[:data].map { |user| user[:id].to_i}

    expect(possible_ids).to eq contained_ids
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
