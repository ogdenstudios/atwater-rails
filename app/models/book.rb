class Book < ApplicationRecord
    belongs_to :author
    mount_uploader :picture, PictureUploader

    enum service: { proof: 0, copyedit: 1 }
end
