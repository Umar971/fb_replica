class Reply < ApplicationRecord
    validates :body, presence: true
    
    
    belongs_to :comment
    belongs_to :user
end
