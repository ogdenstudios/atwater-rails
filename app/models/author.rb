class Author < ApplicationRecord
    has_many :books

    def to_param
        slug
      end
end
