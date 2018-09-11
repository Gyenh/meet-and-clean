class AddBannerUrlToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :banner_url, :string
  end
end
