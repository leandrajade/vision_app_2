class Gallery < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    has_many :images 
    has_many :gallery_images
    has_many :images, through: :gallery_images

    belongs_to :user
end
