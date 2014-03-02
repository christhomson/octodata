class RemoveDownloadIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :download_id, :integer
  end
end
