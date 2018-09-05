class Mob < ApplicationRecord
  has_many :events
  has_many :admins
end
