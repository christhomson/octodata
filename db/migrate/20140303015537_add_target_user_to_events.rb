class AddTargetUserToEvents < ActiveRecord::Migration
  def change
    add_column :events, :target_user, :string
  end
end
