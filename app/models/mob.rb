class Mob < ApplicationRecord
  has_many :events
  has_many :admins

  validates :name, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  
end
