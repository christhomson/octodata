class AddRefTypeMasterBranchAndDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ref_type, :string
    add_column :events, :master_branch, :string
    add_column :events, :description, :string
  end
end
