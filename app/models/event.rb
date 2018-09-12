class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents

  # Validation des formulaires
  validates :name, length: {minimum: 2, maximum: 150}
  validates :place, :length => { :maximum => 200 }
  validates :description, :length => { :maximum => 450 }

end
