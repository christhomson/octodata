class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :message
      t.string :author_name
      t.string :author_email
      t.string :url
      t.boolean :distinct
      t.integer :event_id

      t.timestamps
    end
  end
end
