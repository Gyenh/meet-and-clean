# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents
  validates :description, length: { maximum: 450 }

  validate :adress_validation

  def adress_validation
    if adress_verif(place)
    else
      errors.add('Erreur, ', 'adresse non reconnue')
    end
  end

  def adress_verif(adress)
    results = Geocoder.search(adress)
    true
  rescue Exception
    false
  end
end
