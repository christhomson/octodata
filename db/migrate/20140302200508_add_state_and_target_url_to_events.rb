class AddStateAndTargetUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :state, :string
    add_column :events, :target_url, :string
  end
end
