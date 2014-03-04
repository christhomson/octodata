class AddPublishedAtToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :published_at, :datetime
  end
end
