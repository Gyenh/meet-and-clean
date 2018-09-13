class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents
  validates :description, :length => { :maximum => 450 }
  #todo corriger le Seed
  validate :v

def v
  if place =="place"

else
    errors.add(:field, "validation")    
  end
end




end
