class AddRemoteIdToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :remote_id, :integer
  end
end
