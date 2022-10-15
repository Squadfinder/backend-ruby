require 'rails_helper'

RSpec.describe "user" do
  it 'get a user' do
    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")

    get "/api/v1/user/#{user.id}"
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
end
