require "CSV"

class AddBooks < SeedMigration::Migration
  def up
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      Book.create!(
        work_done: row[0],
        genre: row[1],
        title: row[3],
        author_id: Author.find_by(full_name: row[4]).id,
        picture: Rails.root.join("app/assets/images/all_covers/#{row[5]}.jpg").open
      )
    end
  end

  def down
    Book.delete_all
  end
end
