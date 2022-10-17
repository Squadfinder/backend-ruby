FactoryBot.define do
  factory :user do
    gamertag { Faker::Esport.player }
    platform { Faker::Game.platform }
  end
end
