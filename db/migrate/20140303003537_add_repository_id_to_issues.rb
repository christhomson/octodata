class AddRepositoryIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :repository_id, :integer
  end
end
