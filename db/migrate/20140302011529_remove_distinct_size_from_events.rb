class RemoveDistinctSizeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :distinct_size
  end
end
