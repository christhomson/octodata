class RemoveLabelsFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :labels, :string
  end
end
