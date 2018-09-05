class Event < ApplicationRecord
  belongs_to :mob
  has_many :userevents
end
