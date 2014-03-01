class AddOccurredAtToEvents < ActiveRecord::Migration
  def change
    add_column :events, :occurred_at, :datetime
  end
end
