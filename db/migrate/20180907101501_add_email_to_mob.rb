class AddEmailToMob < ActiveRecord::Migration[5.2]
  def change
    add_column :mobs, :email, :string
  end
end
