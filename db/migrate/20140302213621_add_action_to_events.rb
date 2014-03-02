class AddActionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :action, :string
  end
end
