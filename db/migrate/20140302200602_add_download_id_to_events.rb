class AddDownloadIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :download_id, :integer
  end
end
