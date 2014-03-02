class AddMergeableStateToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :mergeable_state, :string
  end
end
