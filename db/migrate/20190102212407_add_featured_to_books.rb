class AddFeaturedToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :featured, :boolean
  end
end
