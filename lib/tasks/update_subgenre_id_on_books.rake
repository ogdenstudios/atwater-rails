desc 'Update books with actual genre relationship'

task :update_subgenre_id_on_books => :environment do 
    Book.all.each do |book| 
        if book[:subgenre].nil? 
            subgenre_id = Subgenre.find_by(name: 'None')
            book.update_column(:subgenre_id, subgenre_id) 
        else
            subgenre_id = Subgenre.find_by(name: book[:subgenre]).id
            book.update_column(:subgenre_id, subgenre_id)
        end
    end
end