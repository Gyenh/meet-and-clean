class CreateToolsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :tools_events do |t|
      t.integer :tool_id
      t.integer :event_id
    end
  end
end
