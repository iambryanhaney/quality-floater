class PostQuality < ApplicationRecord
    belongs_to :post
    belongs_to :quality
end
