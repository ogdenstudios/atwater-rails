class AddSubgenreRelationshipToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :subgenre_id, :integer
  end
end
