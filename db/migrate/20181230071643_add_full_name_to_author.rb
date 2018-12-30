class AddFullNameToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :full_name, :string
  end
end
