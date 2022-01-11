class Gallery < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 40 }

    has_many :images
    belongs_to :user
end
