desc 'Update genres with slug columns'

task :update_genres_with_slug_columns => :environment do 
    Genre.all.each do |genre| 
        if genre.name == 'romance'
            genre.update_column(:slug, 'romance')
        elsif genre.name == 'fiction'
            genre.update_column(:slug, 'fiction')
        elsif genre.name == 'action, mystery, suspense, thriller'
            genre.update_column(:slug, 'action')
        else 
            genre.update_column(:slug, 'science-fiction')
        end
    end
end