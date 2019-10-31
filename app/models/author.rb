class Author < ApplicationRecord
    has_many :books

    def to_param
        slug
      end

      def featured_book 
        self.books.where(featured: true)[0] ? self.books.where(featured: true)[0] : self.books[0]
      end
end
