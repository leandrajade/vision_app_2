class Gallery < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    has_many :gallery_image, foreign_key: :gallery_id, class_name: "GalleryImage"
    # has_many :images, through: :gallery_image

    belongs_to :user
end
