desc 'Create subgenre objects based on what exists'

task :create_current_subgenres => :environment do 
    Subgenre.destroy_all
    Book.distinct.pluck(:subgenre).each do |subgenre| 
        Subgenre.create(name: subgenre) unless subgenre.nil?
    end
    Subgenre.create(name: 'None')
end