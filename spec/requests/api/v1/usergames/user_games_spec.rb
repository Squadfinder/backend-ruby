require 'rails_helper'

describe "Users games" do
  it 'Can return a list of all Users games' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user2 = User.create!(gamertag: "HelloSaltyImDad", platform: "x-box")

    usergame1 = UserGame.create!(user_id: user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    usergame2 = UserGame.create!(user_id: user.id, game_id: 2387, image_url: "www.pic.com/image.img", game_title: "Squad")
    usergame3 = UserGame.create!(user_id: user.id, game_id: 2323, image_url: "www.pic.com/image.img", game_title: "Scorn")
    usergame4 = UserGame.create!(user_id: user.id, game_id: 2356, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")
    usergame5 = UserGame.create!(user_id: user2.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")

    get api_v1_user_usergames_path(user)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(result.count).to eq(4)
    expect(result[1]).to have_key(:id)
    expect(result[1][:id]).to be_a(String)
    expect(result[1][:type]).to eq("user_game")

    expect(result[1][:attributes]).to have_key(:user_id)
    expect(result[1][:attributes][:user_id]).to be_a(Integer)

    expect(result[1][:attributes]).to have_key(:game_id)
    expect(result[1][:attributes][:game_id]).to be_a(Integer)

    expect(result[1][:attributes]).to have_key(:image_url)
    expect(result[1][:attributes][:image_url]).to be_a(String)

    expect(result[1][:attributes]).to have_key(:game_title)
    expect(result[1][:attributes][:game_title]).to be_a(String)
  end

  it 'can delete a user game' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    usergame1 = UserGame.create!(user_id: user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")

    get api_v1_user_usergames_path(user)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(result.count).to eq(1)

    delete "/api/v1/users/#{user.id}/usergames/#{usergame1.id}"

    expect(UserGame.count).to eq(0)

  end

  it 'return error 404 if can not delete a user game' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    usergame1 = UserGame.create!(user_id: user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")

    get api_v1_user_usergames_path(user)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(result.count).to eq(1)

    delete "/api/v1/users/#{user.id}/usergames/25"

     expect(response).to have_http_status(404)

  end
  
end
