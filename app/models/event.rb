class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents


  validates :name, presence: true, length: { maximum: 15 }
  
  validates :place, presence: true
  validates :description, :length => { :maximum => 450 }

end
