class Image < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    belongs_to :user

    mount_uploader :picture, PictureUploader
end
