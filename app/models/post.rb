class Post < ApplicationRecord
    validates :title, presence: true, length: {in: 3..50}, uniqueness: true
    validates :content, presence: true, length: {in: 50..1000}
end
