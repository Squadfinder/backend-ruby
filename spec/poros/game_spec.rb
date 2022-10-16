require 'rails_helper'

RSpec.describe Game do 
  describe '#attributes' do
    it 'has attributes' do
      data = {
        id: 4200,
        name: 'Portal 2',
        background_image: "https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg",
        genres: [
          {
            "name": "Shooter"
          },
          {
            "name": "Puzzle"
          }
        ],
        parent_platforms: [
          platform: {
            name: "Xbox"
          },
          platform: {
            name: "Playstation"
          },
        ]
      }
    end
  end
end 
