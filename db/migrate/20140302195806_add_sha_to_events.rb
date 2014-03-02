class AddShaToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sha, :string
  end
end
