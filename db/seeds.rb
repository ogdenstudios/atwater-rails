# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create([{
  work_done: 'copyedit',
  genre: 'Fiction',
  title: 'The Other Side of the World',
  old_filename: 'Vince_Suzanne_MyMothersJournals'
}])

Author.create([{
  first_name: 'Suzanne',
  last_name: 'Vince'
}])
