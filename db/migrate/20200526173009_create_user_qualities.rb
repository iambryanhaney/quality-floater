class CreateUserQualities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_qualities do |t|
      t.integer :user_id
      t.integer :quality_id
      t.float :rating

      t.timestamps
    end
  end
end
