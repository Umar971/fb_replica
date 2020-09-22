class Comment < ApplicationRecord
    validates :body, presence: true
    
    belongs_to :user
    belongs_to :post
    has_many :replies, dependent: :destroy

end
