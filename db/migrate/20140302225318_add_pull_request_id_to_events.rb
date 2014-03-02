class AddPullRequestIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pull_request_id, :integer
  end
end
