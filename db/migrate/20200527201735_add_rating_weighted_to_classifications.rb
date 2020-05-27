class AddRatingWeightedToClassifications < ActiveRecord::Migration[6.0]
  def change
    add_column :classifications, :rating_weighted, :float
  end
end
