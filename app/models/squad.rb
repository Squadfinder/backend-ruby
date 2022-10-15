class Squad < ApplicationRecord
  validates_presence_of :game
  validates_presence_of :day
  validates_presence_of :time
  validates_presence_of :number_players
  validates_numericality_of :number_players, only_integer: true
  validates_presence_of :competitive
  has_many :user_squads
  has_many :users, through: :user_squads
end

# Do we want to separate day and time to different variables? Could create issues with time zones (e.g. 11PM PST will be 2AM EST on the next day, but day won't get updated)