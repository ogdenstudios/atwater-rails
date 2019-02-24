class AddFeaturedBookToAuthors < SeedMigration::Migration
  def up
    Author.all.each do |author|
      if author.books.count > 0 
        firstBook = author.books[0]
        firstBook.featured = true 
        firstBook.save! 
      end
    end
  end

  def down

  end
end
