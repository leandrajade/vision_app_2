class User < ApplicationRecord
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
    
    has_many :images
end
