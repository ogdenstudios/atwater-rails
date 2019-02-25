require "csv"
class SeedGenres < SeedMigration::Migration
  def up
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      unless Genre.find_by(name: row[1])
        Genre.create!(name: row[1])
      end
    end
  end

  def down
    Genre.delete_all
  end
end
