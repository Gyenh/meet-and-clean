class Event < ApplicationRecord
  belongs_to :mob
  has_many :users, through: :userevents
end
