
class Image < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    belongs_to :user
    # belongs_to :gallery, optional: true
    mount_uploader :img, ImgUploader

end
