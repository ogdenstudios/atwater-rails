require "csv"
class AddSubgenresToBooks < SeedMigration::Migration
  def up
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      Book.find_by(title: row[3]).update_column(:subgenre, row[2])
    end
  end

  def down

  end
end