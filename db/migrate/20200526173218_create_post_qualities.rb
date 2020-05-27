class CreatePostQualities < ActiveRecord::Migration[6.0]
  def change
    create_table :post_qualities do |t|
      t.integer :post_id
      t.integer :quality_id
      t.float :rating

      t.timestamps
    end
  end
end
