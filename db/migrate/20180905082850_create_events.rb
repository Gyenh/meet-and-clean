class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :place
      t.text :description
      t.date :date
    end
  end
end
