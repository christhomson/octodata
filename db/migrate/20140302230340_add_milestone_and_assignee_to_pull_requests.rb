class AddMilestoneAndAssigneeToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :milestone, :string
    add_column :pull_requests, :assignee, :string
  end
end
