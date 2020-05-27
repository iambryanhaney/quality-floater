class RenameRatingSnapshotToRatingRaw < ActiveRecord::Migration[6.0]
  def change
    rename_column :classifications, :rating_snapshot, :rating_raw
  end
end
