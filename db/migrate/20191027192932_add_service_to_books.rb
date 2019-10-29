class AddServiceToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :service, :integer
  end
end
