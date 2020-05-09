require "csv"

class AddBooks < SeedMigration::Migration
  def up
    g = Genre.create!(name: 'placeholder')
    s = Subgenre.create!(name: 'placeholder')
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      Book.create!(
        service: row[0],
        genre: g,
        subgenre: s,
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
