FactoryBot.define do
  factory :squad do
    game { Faker::Game.title }
    event_time { Faker::Time.forward(days: 5) }
    number_players { Faker::Number.between(from: 1, to: 4) }
    competitive { true }
  end
end
