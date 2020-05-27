class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.integer :user_id
      t.integer :classifier_id
      t.integer :post_id
      t.integer :quality_id
      t.float :rating_snapshot
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
