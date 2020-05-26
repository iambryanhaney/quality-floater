class Post < ApplicationRecord
    has_many :post_qualities
    has_many :qualities, through: :post_qualities

    belongs_to :user

    has_many :classifications

    

    def classify(quality_id, rating)
        self.post_qualities.find_by(quality_id: quality_id).update(rating: rating)
    end

end
