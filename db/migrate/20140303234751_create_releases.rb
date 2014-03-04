class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :url
      t.integer :remote_id
      t.string :tag_name
      t.string :target_commitish
      t.string :name
      t.text :body
      t.boolean :draft
      t.boolean :prerelease
      t.datetime :remote_created_at
      t.string :author

      t.timestamps
    end
  end
end
