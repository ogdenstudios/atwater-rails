class AddWebsiteToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :website, :string
  end
end
