class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
