class Book < ApplicationRecord
    belongs_to :author
    belongs_to :genre 
    belongs_to :subgenre
    mount_uploader :picture, PictureUploader

    enum service: { proof: 0, copyedit: 1 }
end
