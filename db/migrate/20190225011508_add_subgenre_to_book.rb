class AddSubgenreToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :subgenre, :string
  end
end
