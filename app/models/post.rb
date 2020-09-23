class Post < ApplicationRecord
    validates :body, presence: true
    
    belongs_to :user
    has_many_attached :images
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
