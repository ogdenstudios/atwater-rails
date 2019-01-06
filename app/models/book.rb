class Book < ApplicationRecord
    belongs_to :author
    mount_uploader :picture, PictureUploader
end
