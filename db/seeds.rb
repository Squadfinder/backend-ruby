# Create all Users
blake = User.create!(gamertag: 'blake', platform: 'PC')
mike = User.create!(gamertag: 'mike', platform: 'PS5')
thomas = User.create!(gamertag: 'thomas', platform: 'XBox')
wes = User.create!(gamertag: 'wes', platform: 'XBox')
anna = User.create(gamertag: 'anna', platform: 'PC')
tom = User.create(gamertag: 'tom', platform: 'PS5')
nick = User.create(gamertag: 'nick', platform: 'XBox')

# Blake's Games: All 5
blake_halo_usergame = UserGame.create!(
  user_id: blake.id, 
  game_id: 58751,
  image_url: 'https://media.rawg.io/media/games/e1f/e1ffbeb1bac25b19749ad285ca29e158.jpg', 
  game_title: 'Halo Infinite')
blake_cod_usergame = UserGame.create!(
  user_id: blake.id, 
  game_id: 418467,
  image_url: 'https://media.rawg.io/media/games/7e3/7e327a055bedb9b6d1be86593bef473d.jpg', 
  game_title: 'Call of Duty: Warzone')
blake_wow_usergame = UserGame.create!(
  user_id: blake.id, 
  game_id: 388315,
  image_url: 'https://media.rawg.io/media/games/1bf/1bff5a69755eaeef9d37b4e0a14e9bca.jpg', 
  game_title: 'World of Warcraft: Shadowlands')
blake_fall_guys_usergame = UserGame.create!(
  user_id: blake.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')
blake_league_usergame = UserGame.create!(
  user_id: blake.id, 
  game_id: 23598,
  image_url: 'https://media.rawg.io/media/games/78b/78bc81e247fc7e77af700cbd632a9297.jpg', 
  game_title: 'League of Legends')

# Mike's Games: Halo, Fall Guys, League of Legends
mike_halo_usergame = UserGame.create!(
  user_id: mike.id, 
  game_id: 58751,
  image_url: 'https://media.rawg.io/media/games/e1f/e1ffbeb1bac25b19749ad285ca29e158.jpg', 
  game_title: 'Halo Infinite')
mike_fall_guys_usergame = UserGame.create!(
  user_id: mike.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')
mike_league_usergame = UserGame.create!(
  user_id: mike.id, 
  game_id: 23598,
  image_url: 'https://media.rawg.io/media/games/78b/78bc81e247fc7e77af700cbd632a9297.jpg', 
  game_title: 'League of Legends')

# Thomas's Games: Halo, Call of Duty, League of Legends
thomas_halo_usergame = UserGame.create!(
  user_id: thomas.id, 
  game_id: 58751,
  image_url: 'https://media.rawg.io/media/games/e1f/e1ffbeb1bac25b19749ad285ca29e158.jpg', 
  game_title: 'Halo Infinite')
thomas_cod_usergame = UserGame.create!(
  user_id: thomas.id, 
  game_id: 418467,
  image_url: 'https://media.rawg.io/media/games/7e3/7e327a055bedb9b6d1be86593bef473d.jpg', 
  game_title: 'Call of Duty: Warzone')
thomas_league_usergame = UserGame.create!(
  user_id: thomas.id, 
  game_id: 23598,
  image_url: 'https://media.rawg.io/media/games/78b/78bc81e247fc7e77af700cbd632a9297.jpg', 
  game_title: 'League of Legends')


# Wes's Games: Halo, Call of Duty, Fall Guys
wes_halo_usergame = UserGame.create!(
  user_id: wes.id, 
  game_id: 58751,
  image_url: 'https://media.rawg.io/media/games/e1f/e1ffbeb1bac25b19749ad285ca29e158.jpg', 
  game_title: 'Halo Infinite')
wes_cod_usergame = UserGame.create!(
  user_id: wes.id, 
  game_id: 418467,
  image_url: 'https://media.rawg.io/media/games/7e3/7e327a055bedb9b6d1be86593bef473d.jpg', 
  game_title: 'Call of Duty: Warzone')
wes_fall_guys_usergame = UserGame.create!(
  user_id: wes.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')

# Anna's Games: Fall Guys, League of Legends
anna_fall_guys_usergame = UserGame.create!(
  user_id: anna.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')
anna_league_usergame = UserGame.create!(
  user_id: anna.id, 
  game_id: 23598,
  image_url: 'https://media.rawg.io/media/games/78b/78bc81e247fc7e77af700cbd632a9297.jpg', 
  game_title: 'League of Legends')

# Tom's Games: Call of Duty, Fall Guys, League of Legends
tom_cod_usergame = UserGame.create!(
  user_id: tom.id, 
  game_id: 418467,
  image_url: 'https://media.rawg.io/media/games/7e3/7e327a055bedb9b6d1be86593bef473d.jpg', 
  game_title: 'Call of Duty: Warzone')
tom_fall_guys_usergame = UserGame.create!(
  user_id: tom.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')
tom_league_usergame = UserGame.create!(
  user_id: tom.id, 
  game_id: 23598,
  image_url: 'https://media.rawg.io/media/games/78b/78bc81e247fc7e77af700cbd632a9297.jpg', 
  game_title: 'League of Legends')

# Nick's Games: Call of Duty, Fall Guys
nick_cod_usergame = UserGame.create!(
  user_id: nick.id, 
  game_id: 418467,
  image_url: 'https://media.rawg.io/media/games/7e3/7e327a055bedb9b6d1be86593bef473d.jpg', 
  game_title: 'Call of Duty: Warzone')
nick_fall_guys_usergame = UserGame.create!(
  user_id: nick.id, 
  game_id: 326292,
  image_url: 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 
  game_title: 'Fall Guys: Ultimate Knockout')

# Squads for all 5 Games
halo_squad = Squad.create!(game: 'Halo: Infinite', event_time: Time.now, competitive: false)
call_of_duty_squad = Squad.create!(game: 'Call of Duty: Warzone', event_time: Time.now, competitive: false, number_players: 3)
wow_squad = Squad.create!(game: 'World of Warcraft: Shadowlands', event_time: Time.now, competitive: true, number_players: 4)
fall_guys_squad = Squad.create!(game: 'Fall Guys: Ultimate Knockout', event_time: Time.now, competitive: false, number_players: 2)
league_of_legends_squad = Squad.create!(game: 'League of Legends', event_time: Time.now, competitive: true, number_players: 2)

# Blake (host), Mike, Thomas, Wes UserSquads to play Halo
blake_halo_usersquad = UserSquad.create!(user_id: blake.id, squad_id: halo_squad.id, host_id: blake.id)
mike_halo_usersquad = UserSquad.create!(user_id: mike.id, squad_id: halo_squad.id, host_id: blake.id)
thomas_halo_usersquad = UserSquad.create!(user_id: thomas.id, squad_id: halo_squad.id, host_id: blake.id)
wes_halo_usersquad = UserSquad.create!(user_id: wes.id, squad_id: halo_squad.id, host_id: blake.id)

# Nick (host), Tom, Thomas UserSquads to play Call of Duty
nick_cod_usersquad = UserSquad.create!(user_id: nick.id, squad_id: call_of_duty_squad.id, host_id: nick.id)
tom_cod_usersquad = UserSquad.create!(user_id: tom.id, squad_id: call_of_duty_squad.id, host_id: nick.id)
thomas_cod_usersquad = UserSquad.create!(user_id: thomas.id, squad_id: call_of_duty_squad.id, host_id: nick.id)

# Blake (host) UserSquad to play World of Warcraft
blake_wow_usersquad = UserSquad.create!(user_id: blake.id, squad_id: wow_squad.id, host_id: blake.id)

# Anna (host), Mike UserSquads to play Fall Guys
anna_fall_guys_usersquad = UserSquad.create!(user_id: anna.id, squad_id: fall_guys_squad.id, host_id: anna.id)
mike_fall_guys_usersquad = UserSquad.create!(user_id: mike.id, squad_id: fall_guys_squad.id, host_id: anna.id)

# Tom (host), Blake UserSquads to play League of Legends
tom_league_usersquad = UserSquad.create!(user_id: tom.id, squad_id: league_of_legends_squad.id, host_id: tom.id)
blake_league_usersquad = UserSquad.create!(user_id: blake.id, squad_id: league_of_legends_squad.id, host_id: tom.id)