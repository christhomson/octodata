class AddEventTypeToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :event_type, :string
  end
end
