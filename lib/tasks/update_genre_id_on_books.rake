desc 'Update books with actual genre relationship'

task :update_genre_id_on_books => :environment do 
    Book.all.each do |book| 
        genre_id = Genre.find_by(name: book[:genre]).id
        book.update_column(:genre_id, genre_id)
    end
end