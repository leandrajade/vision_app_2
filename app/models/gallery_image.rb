class GalleryImage < ApplicationRecord
    belongs_to :gallery, foreign_key: :gallery_id, class_name: "Gallery"
    belongs_to :image, foreign_key: :image_id, class_name: "Image"
end
