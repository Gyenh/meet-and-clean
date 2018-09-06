class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents
end
