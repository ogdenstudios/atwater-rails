class AddVisibleToggleToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :visible, :boolean
  end
end
