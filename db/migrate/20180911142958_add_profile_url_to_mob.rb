class AddProfileUrlToMob < ActiveRecord::Migration[5.2]
  def change
    add_column :mobs, :profile_url, :string
  end
end
