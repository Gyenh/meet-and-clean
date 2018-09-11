class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents
  validates :description, :length => { :maximum => 450 }

end
