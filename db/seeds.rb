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
    old_filename: "#{row[4]}"
  )
end

Author.create([
  {
    first_name: "Ava",
    last_name: "Bradley"
  },
  {
    first_name: "JM",
    last_name: "Davies"
  },
  {
    first_name: "Will",
    last_name: "Brink"
  },
  {first_name: "Mike",
    last_name: "Chatfield"
  },
  {first_name: "Reut",
    last_name: "Barak"
    }, {first_name: "Jerri",
    last_name: "Hines"
    }, {first_name: "Victoria",
    last_name: "Chase"
    }, {first_name: "Pamela",
    last_name: "Fryer"
    }, {first_name: "Jenni",
    last_name: "Bradley"
    }, {first_name: "Valerie",
    last_name: "Ullmer"
    }, {first_name: "Monique",
    last_name: "DeBois"
    }, {first_name: "JC",
    last_name: "Davis"
    }, {first_name: "Trish",
    last_name: "Loye"
    }, {first_name: "MJ",
    last_name: "Pullen"
    }, {first_name: "Jay",
    last_name: "Korza"
    }, {first_name: "Tracy",
    last_name: "Sharp"
    }, {first_name: "Jason",
    last_name: "Halstead"
    }, {first_name: "Tom",
    last_name: "Bradley"
    }, {first_name: "Mallory",
    last_name: "Crowe"
    }, {first_name: "Evelyn",
    last_name: "Adams"
    }, {first_name: "Theresa",
    last_name: "Ragan"
    }, {first_name: "Lori",
    last_name: "Sjoberg"
    }, {first_name: "Eva",
    last_name: "Charles"
    }, {first_name: "Tempest",
    last_name: "Harte"
    }, {first_name: "LC",
    last_name: "Giroux"
    }, {first_name: "Elena",
    last_name: "Aitken"
    }, {first_name: "Tameri",
    last_name: "Etherton"
    }, {first_name: "Laurie",
    last_name: "LeClair"
    }, {first_name: "EB",
    last_name: "Black"
    }, {first_name: "Suzanne",
    last_name: "Vince"
    }, {first_name: "Kevin",
    last_name: "Hardman"
    }, {first_name: "Earl",
    last_name: "Hardman"
    }, {first_name: "Steena",
    last_name: "Holmes"
    }, {first_name: "Kelly",
    last_name: "Ilebode"
    }, {first_name: "Debra",
    last_name: "Clopton"
    }, {first_name: "SP",
    last_name: "Cervantes"
    }, {first_name: "Katheryn",
    last_name: "Lane"
    }, {first_name: "Dawn",
    last_name: "Dawn"
    }, {first_name: "Sean",
    last_name: "Walton"
    }, {first_name: "Karen",
    last_name: "Carr"
    }, {first_name: "Colleen",
    last_name: "Connally"
    }, {first_name: "Sara",
    last_name: "Andre"
    }, {first_name: "Julieann",
    last_name: "Dove"
    }, {first_name: "Christopher",
    last_name: "Greyson"
    }, {first_name: "Robyn",
    last_name: "Kelly"
    }, {first_name: "JS",
    last_name: "Scott"
    }, {first_name: "Cali",
    last_name: "MacKay"
    }, {first_name: "Riley",
    last_name: "Ford"
    }, {first_name: "Jolene",
    last_name: "Grace"
    }, {first_name: "Barbara",
    last_name: "Freethy"
    }, {first_name: "Rick",
    last_name: "Bettencourt"
  }
])
