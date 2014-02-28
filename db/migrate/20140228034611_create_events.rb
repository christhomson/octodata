class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.integer :repository_id
      t.integer :remote_id
      t.integer :distinct_size

      t.timestamps
    end
  end
end
