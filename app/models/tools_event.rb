class ToolsEvent < ApplicationRecord
  belongs_to :event
  belongs_to :tool
end
