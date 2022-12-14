class User < ApplicationRecord
  validates_presence_of :gamertag
  validates_presence_of :platform
  validates_presence_of :email

  has_many :user_squads
  has_many :squads, through: :user_squads
  has_many :user_games
end
