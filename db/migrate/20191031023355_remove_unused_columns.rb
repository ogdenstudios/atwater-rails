class RemoveUnusedColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :work_done
    remove_column :books, :genre 
    remove_column :books, :subgenre
  end
end
