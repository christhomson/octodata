class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :url
      t.string :html_url
      t.integer :remote_id
      t.string :name
      t.string :description
      t.integer :size
      t.integer :download_count
      t.string :content_type

      t.timestamps
    end
  end
end
