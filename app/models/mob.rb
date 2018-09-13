# frozen_string_literal: true

class Mob < ApplicationRecord
  has_many :events
  has_many :admins

  # Validation des formulaires
  validates :description, length: { maximum: 450 }
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 150 }
  validates :phone, length: { maximum: 15 }, numericality: { only_integer: true }
  validates :web_url_1, length: { maximum: 80 }
  validates :web_url_2, length: { maximum: 80 }
end
