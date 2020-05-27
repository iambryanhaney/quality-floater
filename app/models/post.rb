class Post < ApplicationRecord
    has_many :post_qualities
    has_many :qualities, through: :post_qualities

    belongs_to :user

    has_many :classifications

end
