class Classification < ApplicationRecord
  belongs_to :user
  belongs_to :classifier, class_name: "User"
  belongs_to :post
  belongs_to :quality


end



