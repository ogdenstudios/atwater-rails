# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Author.create([
  {
    first_name: "Ava",
    last_name: "Bradley", 
    full_name: "Bradley, Ava"
  },
  {
    first_name: "JM",
    last_name: "Davies",
    full_name: "Davies, Jen"

  },
  {
    first_name: "Will",
    last_name: "Brink",
    full_name: "Brink, Will"
  },
  {
    first_name: "Mike",
    last_name: "Chatfield",
    full_name: "Chatfield, Mike"
  },
  {
    first_name: "Reut",
    last_name: "Barak", 
    full_name: "Barak, Reut"
  }, 
  {
    first_name: "Jerri",
    last_name: "Hines",
    full_name: "Hines, Jerri"
  }, 
  {
    first_name: "Victoria",
    last_name: "Chase",
    full_name: "Chase, Victoria"
  }, 
  {
    first_name: "Pamela",
    last_name: "Fryer",
    full_name: "Fryer, Pamela"
  }, 
  {
    first_name: "Jenni",
    last_name: "Bradley",
    full_name: "Bradley, Jenni"
  }, 
  {
    first_name: "Valerie",
    last_name: "Ullmer",
    full_name: "Ullmer, Valerie"
  }, 
  {
    first_name: "Monique",
    last_name: "DeBois",
    full_name: "DeBois, Monique"
  }, 
  {
    first_name: "JC",
    last_name: "Davis",
    full_name: "Davis, JC"
  }, 
  {
    first_name: "Trish",
    last_name: "Loye",
    full_name: "Loye, Trish"
  }, 
  {
    first_name: "MJ",
    last_name: "Pullen",
    full_name: "Pullen, MJ"
  }, 
  {
    first_name: "Jay",
    last_name: "Korza",
    full_name: "Korza, Jay"
  }, 
  {
    first_name: "Tracy",
    last_name: "Sharp",
    full_name: "Sharp, Tracy"
  }, 
  {
    first_name: "Jason",
    last_name: "Halstead",
    full_name: "Halstead, Jason",
    featured_author: true,
    testimonial: "Faith is amazing. A bargain price for editing that is superior to anyone else I’ve ever used, and that’s just on the surface. When I try to edit or talk to others about it, it’s a ponderous chore that I understand. Even worse, I accept mistakes because I know I couldn’t catch them. With Faith, I don’t have to worry about that; she actually makes multiple passes through my books and finds things that blow me away every time."
  }, 
  {
    first_name: "Tom",
    last_name: "Bradley",
    full_name: "Bradley, Tom"
  }, 
  {
    first_name: "Mallory",
    last_name: "Crowe",
    full_name: "Crowe, Mallory",
    featured_author: true,
    testimonial: "I’m so lucky to work with Faith! She works with my crazy schedule and can get my books back to me really fast with no errors. In this business, it’s so important to work with people who are reliable and dependable and I’m so grateful to have Faith on my team!"
  }, 
  {
    first_name: "Evelyn",
    last_name: "Adams",
    full_name: "Adams, Evelyn"
  }, 
  {
    first_name: "Theresa",
    last_name: "Ragan",
    full_name: "Ragan, Theresa",
    featured_author: true,
    testimonial: "I have many beta readers, but my books still had typographical and grammar problems. The Atwater Group made all the difference, bringing all seven of my books so far to a new level. Faith is great to work with, personable and professional. She brings consistency and clarity to my work at a reasonable price. I highly recommend Faith Williams at the Atwater Group"
  }, 
  {
    first_name: "Lori",
    last_name: "Sjoberg",
    full_name: "Sjoberg, Lori",
    featured_author: true,
    testimonial: "As an indie writer, it’s critical for me to have an editor who makes my manuscripts shine. Faith is thorough, professional, quick, and extremely competent. I wouldn’t dream of publishing a novel without having her edit it first!"
  }, 
  {
    first_name: "Eva",
    last_name: "Charles",
    full_name: "Charles, Eva"
  }, 
  {
    first_name: "Tempest",
    last_name: "Harte",
    full_name: "Harte, Tempest"
  }, 
  {
    first_name: "LC",
    last_name: "Giroux",
    full_name: "Giroux, LC"
  }, 
  {
    first_name: "Elena",
    last_name: "Aitken",
    full_name: "Aitken, Elena",
    featured_author: true,
    testimonial: "I have worked with Faith for years on over fifteen projects and I consider her to be a crucial part of my publishing team. Her sharp eye for detail, her continuity across a series and investment in my stories makes her absolutely invaluable. With Faith I can always count on top-notch professionalism, quick and quality turnaround which never fails to meet deadline. She never fails to make me look good!"
  }, 
  {
    first_name: "Tameri",
    last_name: "Etherton",
    full_name: "Etherton, Tameri",
    featured_author: true,
    testimonial: "I love working with Faith on all my books. She’s professional, courteous, and I always know my books will be stronger from having her input. I wouldn’t dream of publishing anything until it’s been through one of her edits. Did I mention how awesomely nice she is? Even when she’s finding all my typos and misspellings, she’s so darn sweet about it. Working with her is a pleasure."
  }, 
  {
    first_name: "Laurie",
    last_name: "LeClair",
    full_name: "LeClair, Laurie",
    featured_author: true,
    testimonial: "Faith Williams is top-notch at what she does! Her expertise, skills, and knowledge have not only made my books better; they’ve made me a better writer!"
  }, 
  {
    first_name: "EB",
    last_name: "Black",
    full_name: "Black, EB"
  }, 
  {
    first_name: "Suzanne",
    last_name: "Vince",
    full_name: "Vince, Suzanne"
  }, 
  {
    first_name: "Kevin",
    last_name: "Hardman",
    full_name: "Hardman, Kevin",
    featured_author: true,
    testimonial: "Faith is absolutely stellar! Not only is she highly skilled and a consummate professional, she’s also extremely personable and a joy to work with. Having her as part of my publishing team has been a critical part of my success, and I recommend her without reservation." 
  }, 
  {
    first_name: "Earl",
    last_name: "Hardman",
    full_name: "Hardman, Earl"
  }, 
  {
    first_name: "Steena",
    last_name: "Holmes",
    full_name: "Holmes, Steena"
  }, 
  {
    first_name: "Kelly",
    last_name: "Ilebode",
    full_name: "Ilebode, Kelly"
  }, 
  {
    first_name: "Debra",
    last_name: "Clopton",
    full_name: "Clopton, Debra",
    featured_author: true,
    testimonial: "Faith Williams is a major part of my editing team. She is completely professional and always has quick turnarounds. For me, with the fast pace way that I work, she is an invaluable asset, especially helping me keep my large series, characters, plots and overall storylines straight." 
  }, 
  {
    first_name: "SP",
    last_name: "Cervantes",
    full_name: "Cervantes, Susan"

  }, 
  {
    first_name: "Katheryn",
    last_name: "Lane",
    full_name: "Lane, Katheryn"
  }, 
  {
    first_name: "Michelle",
    last_name: "Dawn",
    full_name: "Dawn, Michelle"

  }, 
  {
    first_name: "Sean",
    last_name: "Walton",
    full_name: "Walton, Sean"
  }, 
  {
    first_name: "Karen",
    last_name: "Carr",
    full_name: "Carr, Karen"
  }, 
  {
    first_name: "Colleen",
    last_name: "Connally",
    full_name: "Connally, Colleen"
  }, 
  {
    first_name: "Sarah",
    last_name: "Andre",
    full_name: "Andre, Sarah"
  }, 
  {
    first_name: "Julieann",
    last_name: "Dove",
    full_name: "Dove, Julieann"
  }, 
  {
    first_name: "Christopher",
    last_name: "Greyson",
    full_name: "Greyson, Christopher"
  }, 
  {
    first_name: "Robyn",
    last_name: "Kelly",
    full_name: "Kelly, Robyn"
  }, 
  {
    first_name: "JS",
    last_name: "Scott",
    full_name: "Scott, JS",
    featured_author: true,
    testimonial: "I am lucky to have Faith (Williams) as my editor. She is a gifted editor. She is incredibly thorough, professional and reliable. She is a great asset to have on my team. Did I mention that she is a delightful person to work with? - J. S. Scott, NY Times & USA Today bestselling Romance Author."
  }, 
  {
    first_name: "Cali",
    last_name: "MacKay",
    full_name: "MacKay, Cali",
    featured_author: true,
    testimonial: "Faith Williams from Atwater has been, hands down, the best editor I’ve worked with. I wouldn’t dream of publishing any of my work if she hasn’t gone through it. Not only is she very professional, detail-oriented and thorough, but also incredibly accommodating! Highly recommend!!"
  }, 
  {
    first_name: "Riley",
    last_name: "Ford",
    full_name: "Ford, Riley"
  }, 
  {
    first_name: "Jolene",
    last_name: "Grace",
    full_name: "Grace, Jolene"
  }, 
  {
    first_name: "Barbara",
    last_name: "Freethy",
    full_name: "Freethy, Barbara"
  }, 
  {
    first_name: "Rick",
    last_name: "Bettencourt",
    full_name: "Bettencourt, Rick"
  },
  {
    first_name: "Carey",
    last_name: "Baldwin",
    full_name: "Baldwin, Carey"
  },
  {
    first_name: "David",
    last_name: "Balzarini",
    full_name: "Balzarini, David"
  },
  {
    first_name: "Maureen",
    last_name: "Betita",
    full_name: "Betita, Maureen"
  },
  {
    first_name: "BL",
    last_name: "Blair",
    full_name: "Blair, BL"
  },
  {
    first_name: "Aine",
    last_name: "Blaze",
    full_name: "Blaze, Aine"
  },
  {
    first_name: "Imogen",
    last_name: "Bold",
    full_name: "Bold, Imogen"
  },
  {
    first_name: "Roxy",
    last_name: "Boroughs",
    full_name: "Boroughs, Roxy"
  },
  {
    first_name: "Li",
    last_name: "Brown",
    full_name: "Brown, Li"
  },
  {
    first_name: "Daria",
    last_name: "Buczynski",
    full_name: "Buczynski, Daria"
  },
  {
    first_name: "Sarra",
    last_name: "Cannon",
    full_name: "Cannon, Sarra"
  },
  {
    first_name: "Chase",
    last_name: "K. Victoria",
    full_name: "K. Victoria, Chase"
  },
  {
    first_name: "Amanda",
    last_name: "Chayse",
    full_name: "Chayse, Amanda"
  },
  {
    first_name: "Ed",
    last_name: "Coburn",
    full_name: "Coburn, Ed"
  },
  {
    first_name: "Thea",
    last_name: "Constantine",
    full_name: "Constantine, Thea"
  },
  {
    first_name: "Wesley",
    last_name: "Cross",
    full_name: "Cross, Wesley"
  },
  {
    first_name: "Laryl",
    last_name: "Dixon",
    full_name: "Dixon, Laryl"
  },
  {
    first_name: "Gwen",
    last_name: "Ellery",
    full_name: "Ellery, Gwen"
  },
  {
    first_name: "Greta Rose",
    last_name: "Evans",
    full_name: "Evans, Greta Rose"
  },
  {
    first_name: "Linda",
    last_name: "Faulkner",
    full_name: "Faulkner, Linda"
  },
  {
    first_name: "Elke",
    last_name: "Feuer",
    full_name: "Feuer, Elke"
  },
  {
    first_name: "Mike",
    last_name: "Fonnesbeck",
    full_name: "Fonnesbeck, Mike"
  },
  {
    first_name: "Joan Riley",
    last_name: "Ford",
    full_name: "Ford, Joan Riley"
  },
  {
    first_name: "Fox",
    last_name: "Victor",
    full_name: "Victor, Fox"
  },
  {
    first_name: "Caroline",
    last_name: "Fyffe",
    full_name: "Fyffe, Caroline"
  },
  {
    first_name: "Gabby",
    last_name: "Green",
    full_name: "Green, Gabby"
  },
  {
    first_name: "Rita",
    last_name: "Garcia",
    full_name: "Garcia, Rita"
  },
  {
    first_name: "Natalie",
    last_name: "Gayle",
    full_name: "Gayle, Natalie"
  },
  {
    first_name: "Evelyn",
    last_name: "Gonzalez",
    full_name: "Gonzalez, Evelyn"
  },
  {
    first_name: "Rachel",
    last_name: "Grant",
    full_name: "Grant, Rachel"
  },
  {
    first_name: "Chris",
    last_name: "Greyson",
    full_name: "Greyson, Chris"
  },
  {
    first_name: "Earl E",
    last_name: "Hardman",
    full_name: "Hardman, Earl E"
  },
  {
    first_name: "Marianna",
    last_name: "Heusler",
    full_name: "Heusler, Marianna"
  },
  {
    first_name: "Nikki",
    last_name: "Hicks",
    full_name: "Hicks, Nikki"
  },
  {
    first_name: "Cheryl",
    last_name: "Howe",
    full_name: "Howe, Cheryl"
  },
  {
    first_name: "Katina",
    last_name: "Jordan",
    full_name: "Jordan, Katina"
  },
  {
    first_name: "Noree",
    last_name: "Kahika",
    full_name: "Kahika, Noree"
  },
  {
    first_name: "Crystal",
    last_name: "Kauffman",
    full_name: "Kauffman, Crystal"
  },
  {
    first_name: "Sandy",
    last_name: "Kirschenbaum",
    full_name: "Kirschenbaum, Sandy"
  },
  {
    first_name: "Sonia",
    last_name: "Konso",
    full_name: "Konso, Sonia"
  },
  {
    first_name: "Jessica",
    last_name: "Koopsman",
    full_name: "Koopsman, Jessica"
  },
  {
    first_name: "Debra",
    last_name: "Kristi",
    full_name: "Kristi, Debra"
  },
  {
    first_name: "Rich",
    last_name: "Leder",
    full_name: "Leder, Rich"
  },
  {
    first_name: "Jesi",
    last_name: "Lee",
    full_name: "Lee, Jesi"
  },
  {
    first_name: "Julia",
    last_name: "London",
    full_name: "London, Julia"
  },
  {
    first_name: "Dawn",
    last_name: "Michelle",
    full_name: "Michelle, Dawn"
  },
  {
    first_name: "Julie",
    last_name: "Napier",
    full_name: "Napier, Julie"
  },
  {
    first_name: "Deena",
    last_name: "Nehring",
    full_name: "Nehring, Deena"
  },
  {
    first_name: "Niki",
    last_name: "Hart",
    full_name: "Hart, Niki"
  },
  {
    first_name: "Howard",
    last_name: "Paar",
    full_name: "Paar, Howard"
  },
  {
    first_name: "Diane",
    last_name: "Patterson",
    full_name: "Patterson, Diane"
  },
  {
    first_name: "Rachel",
    last_name: "Pudsey",
    full_name: "Pudsey, Rachel"
  },
  {
    first_name: "Jewel",
    last_name: "Quinlan",
    full_name: "Quinlan, Jewel"
  },
  {
    first_name: "Kimberley",
    last_name: "Reeves",
    full_name: "Reeves, Kimberley"
  },
  {
    first_name: "CW",
    last_name: "Schutter",
    full_name: "Schutter, CW"
  },
  {
    first_name: "Juliette",
    last_name: "Sobanet",
    full_name: "Sobanet, Juliette"
  },
  {
    first_name: "Dave",
    last_name: "Stever",
    full_name: "Stever, Dave"
  },
  {
    first_name: "J.E.",
    last_name: "Taylor",
    full_name: "Taylor, J.E."
  },
  {
    first_name: "Lola",
    last_name: "Taylor",
    full_name: "Taylor, Lola"
  },
  {
    first_name: "Caterina",
    last_name: "Torres",
    full_name: "Torres, Caterina"
  },
  {
    first_name: "Lane",
    last_name: "Tracey",
    full_name: "Tracey, Lane"
  },
  {
    first_name: "Michelle",
    last_name: "Vernal",
    full_name: "Vernal, Michelle"
  },
  {
    first_name: "Scott",
    last_name: "White",
    full_name: "White, Scott"
  },
  {
    first_name: "Lily",
    last_name: "Zante",
    full_name: "Zante, Lily"
  }
])

CSV.foreach(Rails.root.join('lib', 'assets', 'cover_listings', "cover_listing_2018.csv")) do |row|
  Book.create(
    work_done: "#{row[0]}",
    genre: "#{row[1]}",
    title: "#{row[2]}",
    author_id: Author.where(full_name: "#{row[3]}")[0].id,
    old_filename: "#{row[4]}"
  )
end

authors = Author.all 

authors.each do |author|
  if author.books.count > 0 
    firstBook = author.books[0]
    firstBook.featured = true 
    firstBook.save! 
  end
end

user = User.create! :email => 'faithgh731@gmail.com', :password => 'password', :password_confirmation => 'password'