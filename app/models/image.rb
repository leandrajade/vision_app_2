class Image < ApplicationRecord
    validates :user_id, presence: true
    validates :title, length: { maximum: 40 }

    belongs_to :user

    has_many :galleries
    has_many :gallery_images, through: :galleries

    mount_uploader :img, ImgUploader
end
