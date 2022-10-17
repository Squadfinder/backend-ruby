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
        {
          platform: {
            name: "Xbox"
        }
        },
        {
          platform: {
            name: "Playstation"
        }
        }
        ]
        }

      game = Game.new(data)

      expect(game).to be_a(Game)
      expect(game.id).to eq(4200)
      expect(game.title).to eq("Portal 2")
      expect(game.image).to eq("https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg")
      expect(game.genres).to be_a(Array)
      expect(game.consoles).to be_a(Array)
    end

    it 'can return just consoles names in an Array' do
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
        {
          platform: {
            name: "Xbox"
        }
        },
        {
          platform: {
            name: "Playstation"
        }
        }
        ]
        }

      game = Game.new(data)
      expect(game.consoles).to eq(["Xbox", "Playstation"])
    end

    it 'can return genre names in an Array' do
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
        {
          platform: {
            name: "Xbox"
        }
        },
        {
          platform: {
            name: "Playstation"
        }
        }
        ]
        }

      game = Game.new(data)
      expect(game.genres).to eq(["Shooter", "Puzzle"])
    end
  end
end 
