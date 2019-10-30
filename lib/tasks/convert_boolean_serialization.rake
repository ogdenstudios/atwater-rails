desc 'Fix the serialized boolean numbers in sqlite'

task :convert_boolean_serialization => :environment do 
    Author.where("featured_author = 't'").update_all(featured_author: 1)
    Author.where("featured_author = 'f'").update_all(featured_author: 0)
    Author.where("visible = 't'").update_all(visible: 1)
    Author.where("visible = 'f'").update_all(visible: 0)
    Book.where("featured = 't'").update_all(featured: 1)
    Book.where("featured = 'f'").update_all(featured: 0)
    User.where("admin_rights = 't'").update_all(admin_rights: 1)
    User.where("admin_rights = 'f'").update_all(admin_rights: 0)
end