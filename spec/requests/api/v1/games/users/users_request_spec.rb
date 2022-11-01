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

    possible_ids = [ User.first.id, User.second.id, User.third.id]

    get api_v1_game_users_path(58751)

    expect(response).to be_successful

    all_users = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    contained_ids = all_users[:data].map { |user| user[:id].to_i}
    expect(possible_ids).to eq contained_ids

    expect(all_users).to be_a Hash

    expect(all_users.keys.count).to eq 1
    expect(all_users.keys).to include(:data)

    all_users[:data].each do |game_user|
      expect(game_user.keys.count).to eq 3
      expect(game_user.keys).to include(:id, :type, :attributes)

      expect(game_user[:id]).to be_a String
      expect(possible_ids).to include(game_user[:id].to_i)

      expect(game_user[:type]).to be_a String
      expect(game_user[:type]).to eq 'game_user'

      expect(game_user[:attributes]).to be_a Hash
      expect(game_user[:attributes].keys.count).to eq 2
      expect(game_user[:attributes].keys).to include(:gamertag, :platform)

      expect(game_user[:attributes][:gamertag]).to be_a String

      expect(game_user[:attributes][:platform]).to be_a String
    end
  end
end
