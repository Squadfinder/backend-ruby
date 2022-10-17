# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
blake = User.create!(gamertag: 'blake', platform: 'PC')
mike = User.create!(gamertag: 'mike', platform: 'PS5')
thomas = User.create!(gamertag: 'thomas', platform: 'XBox')

test_squad = Squad.create!(game: 'WoW', event_time: Time.now, competitive: 'true')

test_user_squad = UserSquad.create!(user_id: blake.id, squad_id: test_squad.id, host_id: blake.id)