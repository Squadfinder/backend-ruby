class UserSquad < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :squad_id
  validates_presence_of :host_id
  validates_presence_of :status
  enum status: { "pending": 0, "approved": 1, "rejected": 2 }
  validates_numericality_of :user_id
  validates_numericality_of :squad_id
  belongs_to :user
  belongs_to :squad

end
