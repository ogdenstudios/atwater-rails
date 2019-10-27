desc 'Create genre objects based on what exists'

task :create_current_genres => :environment do 
    Genre.destroy_all
    Book.distinct.pluck(:genre).each do |genre| 
        Genre.create(name: genre.titleize)
    end
end