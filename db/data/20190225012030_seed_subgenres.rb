require "csv"
class SeedSubgenres < SeedMigration::Migration
  def up
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      unless Subgenre.find_by(name: row[2])
        Subgenre.create!(name: row[2])
      end
    end
  end

  def down
    Subgenre.delete_all
  end
end