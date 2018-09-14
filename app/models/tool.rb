class Tool < ApplicationRecord
  has_many :tools_events
  has_many :events, through: :tools_events
end
