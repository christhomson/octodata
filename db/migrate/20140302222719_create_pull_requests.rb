class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.string :url
      t.integer :number
      t.string :state
      t.string :title
      t.text :body
      t.datetime :remote_created_at
      t.datetime :closed_at
      t.datetime :merged_at
      t.string :head_sha
      t.string :head_ref
      t.string :base_sha
      t.string :base_ref
      t.string :merge_commit_sha
      t.boolean :merged
      t.boolean :mergeable
      t.string :merged_by
      t.integer :comments
      t.integer :commits
      t.integer :additions
      t.integer :deletions
      t.integer :changed_files
      t.integer :repository_id

      t.timestamps
    end
  end
end
