class User < ApplicationRecord
    has_many :posts
    has_many :comments
    validates :name, length: {maximum: 140, minimum: 4}, presence: true,
    format: { with: /\A[a-zA-Z ]+\z/}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
