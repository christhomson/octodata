class AddFieldsForPushEventsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :head, :string
    add_column :events, :ref, :string
    add_column :events, :size, :integer
  end
end
