require 'rails_helper'

RSpec.describe "user" do
  it 'get a user' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    get "/api/v1/users/#{user.id}"
    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    # binding.pry
    expect(result).to have_key(:id)
    expect(result[:id]).to be_a(String)
    expect(result[:type]).to eq("user")
    expect(result[:attributes]).to have_key(:gamertag)
    expect(result[:attributes][:gamertag]).to be_a(String)
    expect(result[:attributes]).to have_key(:platform)
    expect(result[:attributes][:platform]).to be_a(String)
  end

  it 'get a user' do
    user1 = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user1 = User.create!(gamertag: "Hateme", platform: "playstation")
    user1 = User.create!(gamertag: "Slayer", platform: "pc")

    get "/api/v1/users"
    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    # binding.pry
    expect(result.count).to eq(3)
    expect(result[0]).to have_key(:id)
    expect(result[0][:id]).to be_a(String)
    expect(result[0][:type]).to eq("user")
    expect(result[0][:attributes]).to have_key(:gamertag)
    expect(result[0][:attributes][:gamertag]).to be_a(String)
    expect(result[0][:attributes]).to have_key(:platform)
    expect(result[0][:attributes][:platform]).to be_a(String)
  end
end
