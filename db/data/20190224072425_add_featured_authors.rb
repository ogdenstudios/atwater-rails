class AddFeaturedAuthors < SeedMigration::Migration
  def up
    [
      {
        slug: "jason-halstead",
        testimonial: "Faith is amazing. A bargain price for editing that is superior to anyone else I’ve ever used, and that’s just on the surface. When I try to edit or talk to others about it, it’s a ponderous chore that I understand. Even worse, I accept mistakes because I know I couldn’t catch them. With Faith, I don’t have to worry about that; she actually makes multiple passes through my books and finds things that blow me away every time."
      },
      {
        slug: "mallory-crowe",
        testimonial: "I’m so lucky to work with Faith! She works with my crazy schedule and can get my books back to me really fast with no errors. In this business, it’s so important to work with people who are reliable and dependable and I’m so grateful to have Faith on my team!"
      },
      {
        slug: "theresa-ragan",
        testimonial: "I have many beta readers, but my books still had typographical and grammar problems. The Atwater Group made all the difference, bringing all seven of my books so far to a new level. Faith is great to work with, personable and professional. She brings consistency and clarity to my work at a reasonable price. I highly recommend Faith Williams at the Atwater Group"
      },
      {
        slug: "lori-sjoberg",
        testimonial: "As an indie writer, it’s critical for me to have an editor who makes my manuscripts shine. Faith is thorough, professional, quick, and extremely competent. I wouldn’t dream of publishing a novel without having her edit it first!"
      },
      {
        slug: "elena-aitken",
        testimonial: "I have worked with Faith for years on over fifteen projects and I consider her to be a crucial part of my publishing team. Her sharp eye for detail, her continuity across a series and investment in my stories makes her absolutely invaluable. With Faith I can always count on top-notch professionalism, quick and quality turnaround which never fails to meet deadline. She never fails to make me look good!"
      },
      {
        slug: "tameri-etherton",
        testimonial: "I love working with Faith on all my books. She’s professional, courteous, and I always know my books will be stronger from having her input. I wouldn’t dream of publishing anything until it’s been through one of her edits. Did I mention how awesomely nice she is? Even when she’s finding all my typos and misspellings, she’s so darn sweet about it. Working with her is a pleasure."
      },
      {
        slug: "laurie-leclair",
        testimonial: "Faith Williams is top-notch at what she does! Her expertise, skills, and knowledge have not only made my books better; they’ve made me a better writer!"
      },
      {
        slug: "kevin-hardman",
        testimonial: "Faith is absolutely stellar! Not only is she highly skilled and a consummate professional, she’s also extremely personable and a joy to work with. Having her as part of my publishing team has been a critical part of my success, and I recommend her without reservation." 
      },
      {
        slug: "debra-clopton",
        testimonial: "Faith Williams is a major part of my editing team. She is completely professional and always has quick turnarounds. For me, with the fast pace way that I work, she is an invaluable asset, especially helping me keep my large series, characters, plots and overall storylines straight." 
      },
      {
        slug: "js-scott",
        testimonial: "I am lucky to have Faith (Williams) as my editor. She is a gifted editor. She is incredibly thorough, professional and reliable. She is a great asset to have on my team. Did I mention that she is a delightful person to work with? - J. S. Scott, NY Times & USA Today bestselling Romance Author."
      },
      {
        slug: "cali-mackay",
        testimonial: "Faith Williams from Atwater has been, hands down, the best editor I’ve worked with. I wouldn’t dream of publishing any of my work if she hasn’t gone through it. Not only is she very professional, detail-oriented and thorough, but also incredibly accommodating! Highly recommend!!"
      },
    ].each do |data|
      Author.find_by(slug: data[:slug]).update_column(:featured_author, true)
      Author.find_by(slug: data[:slug]).update_column(:testimonial, data[:testimonial])
    end
  end

  def down

  end
end
