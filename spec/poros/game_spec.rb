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
        ],
        description: "<p>Portal 2 is a first-person puzzle game developed by Valve Corporation and released on April 19, 2011 on Steam, PS3 and Xbox 360. It was published by Valve Corporation in digital form and by Electronic Arts in physical form. </p>\n<p>Its plot directly follows the first game&#39;s, taking place in the Half-Life universe. You play as Chell, a test subject in a research facility formerly ran by the company Aperture Science, but taken over by an evil AI that turned upon its creators, GladOS. After defeating GladOS at the end of the first game but failing to escape the facility, Chell is woken up from a stasis chamber by an AI personality core, Wheatley, as the unkempt complex is falling apart. As the two attempt to navigate through the ruins and escape, they stumble upon GladOS, and accidentally re-activate her...</p>\n<p>Portal 2&#39;s core mechanics are very similar to the first game&#39;s ; the player must make their way through several test chambers which involve puzzles. For this purpose, they possess a Portal Gun, a weapon capable of creating teleportation portals on white surfaces. This seemingly simple mechanic and its subtleties coupled with the many different puzzle elements that can appear in puzzles allows the game to be easy to start playing, yet still feature profound gameplay. The sequel adds several new puzzle elements, such as gel that can render surfaces bouncy or allow you to accelerate when running on them.</p>\n<p>The game is often praised for its gameplay, its memorable dialogue and writing and its aesthetic. Both games in the series are responsible for inspiring most puzzle games succeeding them, particularly first-person puzzle games. The series, its characters and even its items such as the portal gun and the companion cube have become a cultural icon within gaming communities.</p>\n<p>Portal 2 also features a co-op mode where two players take on the roles of robots being led through tests by GladOS, as well as an in-depth level editor.</p>"
        }

      game = Game.new(data)

      expect(game).to be_a(Game)
      expect(game.id).to eq(4200)
      expect(game.title).to eq("Portal 2")
      expect(game.image).to eq("https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg")
      expect(game.genres).to be_a(Array)
      expect(game.consoles).to be_a(Array)
      expect(game.description).to be_a(String)
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
        ],
        description: "<p>Portal 2 is a first-person puzzle game developed by Valve Corporation and released on April 19, 2011 on Steam, PS3 and Xbox 360. It was published by Valve Corporation in digital form and by Electronic Arts in physical form. </p>\n<p>Its plot directly follows the first game&#39;s, taking place in the Half-Life universe. You play as Chell, a test subject in a research facility formerly ran by the company Aperture Science, but taken over by an evil AI that turned upon its creators, GladOS. After defeating GladOS at the end of the first game but failing to escape the facility, Chell is woken up from a stasis chamber by an AI personality core, Wheatley, as the unkempt complex is falling apart. As the two attempt to navigate through the ruins and escape, they stumble upon GladOS, and accidentally re-activate her...</p>\n<p>Portal 2&#39;s core mechanics are very similar to the first game&#39;s ; the player must make their way through several test chambers which involve puzzles. For this purpose, they possess a Portal Gun, a weapon capable of creating teleportation portals on white surfaces. This seemingly simple mechanic and its subtleties coupled with the many different puzzle elements that can appear in puzzles allows the game to be easy to start playing, yet still feature profound gameplay. The sequel adds several new puzzle elements, such as gel that can render surfaces bouncy or allow you to accelerate when running on them.</p>\n<p>The game is often praised for its gameplay, its memorable dialogue and writing and its aesthetic. Both games in the series are responsible for inspiring most puzzle games succeeding them, particularly first-person puzzle games. The series, its characters and even its items such as the portal gun and the companion cube have become a cultural icon within gaming communities.</p>\n<p>Portal 2 also features a co-op mode where two players take on the roles of robots being led through tests by GladOS, as well as an in-depth level editor.</p>"
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
        ],
        description: "<p>Portal 2 is a first-person puzzle game developed by Valve Corporation and released on April 19, 2011 on Steam, PS3 and Xbox 360. It was published by Valve Corporation in digital form and by Electronic Arts in physical form. </p>\n<p>Its plot directly follows the first game&#39;s, taking place in the Half-Life universe. You play as Chell, a test subject in a research facility formerly ran by the company Aperture Science, but taken over by an evil AI that turned upon its creators, GladOS. After defeating GladOS at the end of the first game but failing to escape the facility, Chell is woken up from a stasis chamber by an AI personality core, Wheatley, as the unkempt complex is falling apart. As the two attempt to navigate through the ruins and escape, they stumble upon GladOS, and accidentally re-activate her...</p>\n<p>Portal 2&#39;s core mechanics are very similar to the first game&#39;s ; the player must make their way through several test chambers which involve puzzles. For this purpose, they possess a Portal Gun, a weapon capable of creating teleportation portals on white surfaces. This seemingly simple mechanic and its subtleties coupled with the many different puzzle elements that can appear in puzzles allows the game to be easy to start playing, yet still feature profound gameplay. The sequel adds several new puzzle elements, such as gel that can render surfaces bouncy or allow you to accelerate when running on them.</p>\n<p>The game is often praised for its gameplay, its memorable dialogue and writing and its aesthetic. Both games in the series are responsible for inspiring most puzzle games succeeding them, particularly first-person puzzle games. The series, its characters and even its items such as the portal gun and the companion cube have become a cultural icon within gaming communities.</p>\n<p>Portal 2 also features a co-op mode where two players take on the roles of robots being led through tests by GladOS, as well as an in-depth level editor.</p>"
        }

      game = Game.new(data)
      expect(game.genres).to eq(["Shooter", "Puzzle"])
    end
  end
end 
