class AddAdminRightsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_rights, :boolean
  end
end
