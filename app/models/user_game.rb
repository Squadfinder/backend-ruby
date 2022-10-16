class UserGame < ApplicationRecord
  validates_presence_of :game_id
  validates_numericality_of :game_id, only_integer: true
  validates_presence_of :image_url
  validates_presence_of :game_title

  belongs_to :user
end