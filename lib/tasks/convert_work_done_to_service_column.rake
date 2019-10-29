desc 'Get the current work_done values out of existing book and set the appropriate service value'

task :convert_work_done_to_service_column => :environment do 
    Book.all.each do |book| 
        if book.work_done == 'proof' || book.work_done == 'Proof' 
            book.update_column(:service, 'proof')
        else 
            book.update_column(:service, 'copyedit')
        end
    end
end