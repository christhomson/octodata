class AddPayloadToEvents < ActiveRecord::Migration
  def change
    add_column :events, :payload, :text
  end
end
