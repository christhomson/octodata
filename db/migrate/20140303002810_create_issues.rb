class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :url
      t.integer :remote_id
      t.integer :number
      t.string :title
      t.string :creator
      t.string :labels
      t.string :state
      t.string :assignee
      t.string :milestone
      t.integer :comments
      t.datetime :remote_created_at
      t.datetime :closed_at
      t.boolean :pull_request
      t.text :body

      t.timestamps
    end
  end
end
