class AddFeaturedToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :featured_author, :boolean
  end
end
