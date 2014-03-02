class AddCommentIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :comment_id, :integer
  end
end
