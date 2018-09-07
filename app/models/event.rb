class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents


  validates :name, presence: true
  validates :place, presence: true
  validates :description, presence: true
  
end
