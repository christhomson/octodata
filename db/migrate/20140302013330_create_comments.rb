class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :html_url
      t.string :url
      t.integer :remote_id
      t.text :body
      t.string :path
      t.integer :position
      t.integer :line
      t.string :commit_id

      t.timestamps
    end
  end
end
