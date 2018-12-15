class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :work_done
      t.string :genre
      t.string :title
      t.string :old_filename

      t.timestamps
    end
  end
end
