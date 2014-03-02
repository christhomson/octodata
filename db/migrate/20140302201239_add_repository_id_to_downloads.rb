class AddRepositoryIdToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :repository_id, :integer
  end
end
