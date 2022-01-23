class Image < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    belongs_to :user

    has_many :gallery_images
    has_many :galleries, through: :gallery_images

    mount_uploader :img, ImgUploader

    # def set_bought
    #     if image.price > 0
    #         image.bought = false
    #     end
    # end 
end
