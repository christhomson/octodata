class AddReleaseIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :release_id, :integer
  end
end
