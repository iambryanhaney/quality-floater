class Quality < ApplicationRecord
    has_many :post_qualities
    has_many :posts, through: :post_qualities

    has_many :user_qualities
    has_many :users, through: :user_qualities

    has_many :classifications

    
end
