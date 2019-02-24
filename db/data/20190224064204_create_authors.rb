require "CSV"

class CreateAuthors < SeedMigration::Migration
  def up
    CSV.foreach(Rails.root.join "db", "data", "csv", "master-list-2019.csv") do |row|
      first_name = row[4].split(", ")[1]
      last_name = row[4].split(", ")[0]
      full_name = row[4] 
      slug = "#{row[4].split(", ")[1].downcase}-#{row[4].split(", ")[0].downcase}"
      unless Author.find_by(slug: slug) 
        Author.create(
          first_name: first_name,
          last_name: last_name,
          full_name: full_name,
          slug: slug
        )
      end
    end  
  end

  def down
    Author.delete_all
  end
end
