class RemovePhoneFromAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :phone, :integer
  end
end
