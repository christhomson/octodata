class AddImportIdAndUserIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :import_id, :integer
    add_column :events, :user_id, :integer
  end
end
