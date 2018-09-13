# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :mob, optional: true
  has_many :userevents
  validates :name, length: {minimum: 2, maximum: 150}
  validates :place, length: { maximum: 200 }
  validates :description, length: { maximum: 450 }

  validate :adress_validation
  # Cette validation appelle notre propre validation maison

  def adress_validation
    if adress_verif(place)
    # Si l'adresse est reconnue par GeoCoder, alors il y a creation de l'event
    else
      errors.add('Erreur, ', 'adresse non reconnue')
    end
  end

  # Methode qui verifie avec l'API GeoCoder
  def adress_verif(adress)
    results = Geocoder.search(adress)
    true
  rescue Exception
    false
  end
end
