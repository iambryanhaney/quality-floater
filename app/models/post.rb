class Post < ApplicationRecord
    has_many :post_qualities
    has_many :qualities, through: :post_qualities

    belongs_to :user

    has_many :classifications



    def quality_rating(quality_id)
        self.classifications.where(quality_id: quality_id, active: true).sum(:rating_weighted)
    end

    def quality_rating_count(quality_id)
        self.classifications.where(quality_id: quality_id, active: true).count
    end

    # def classifiers_quality_average_raw(quality_id)
    #     #self.classifications.where(quality_id: quality_id, active: true).average(:rating_raw).to_f
    # end

    # def classifiers_quality_average_weighted(quality_id)
    #     weighted_average = self.classifications_received.where(quality_id: quality_id, active: true).average(:rating_weighted).to_f
    # end

end
