# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.foreach(Rails.root.join('lib', 'assets', 'cover_listings', "cover_listing_2018.csv")) do |row|
  Book.create(
    work_done: "#{row[0]}",
    genre: "#{row[1]}",
    title: "#{row[2]}",
    old_filename: "#{row[3]}"
  )
end


Author.create([{
  first_name: 'Suzanne',
  last_name: 'Vince'
}])
