class AddRepositoryIdToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :repository_id, :integer
  end
end
