class CreateQualities < ActiveRecord::Migration[6.0]
  def change
    create_table :qualities do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
