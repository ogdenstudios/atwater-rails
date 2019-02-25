class AddNameToSubgenre < ActiveRecord::Migration[5.1]
  def change
    add_column :subgenres, :name, :string
  end
end
