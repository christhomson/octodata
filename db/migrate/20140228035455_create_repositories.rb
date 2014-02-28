class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :owner
      t.boolean :private
      t.boolean :fork
      t.integer :remote_id

      t.timestamps
    end
  end
end
