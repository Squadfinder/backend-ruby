require 'rails_helper'

describe 'Games API' do 
  it 'return a serialized response to a get specific game request', :vcr do

    get api_v1_game_path(4200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(data).to be_a(Hash)
    expect(data).to have_key(:title)
    expect(data[:title]).to eq("Portal 2")
    expect(data).to have_key(:image)
    expect(data[:image]).to eq("https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg")
    expect(data).to have_key(:genres)
    expect(data[:genres]).to be_a(Array)
    expect(data[:genres][0]).to eq("Shooter")
    expect(data[:genres][1]).to eq("Puzzle")
    expect(data).to have_key(:consoles)
    expect(data[:consoles]).to be_a(Array)
    expect(data[:consoles][0]).to eq("PC")
    expect(data[:consoles][1]).to eq("PlayStation")
    expect(data[:consoles][2]).to eq("Xbox")
    expect(data[:consoles][3]).to eq("Apple Macintosh")
    expect(data[:consoles][4]).to eq("Linux")
  end
  
  it 'renders an error if no data is available for a given game/ID', :vcr do
    get api_v1_game_path(12930487417410978241379081243907812349078)

    expect(response).to_not be_successful
    expect(response.status).to eq 404

    result = JSON.parse(response.body, symbolize_names: true)
    expect(result.keys).to include(:description)
    expect(result[:description]).to eq "Error: No game found"
  end
end