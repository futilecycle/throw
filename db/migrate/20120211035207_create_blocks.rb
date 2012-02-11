class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.time :start_time
      t.time :end_time
      t.references :user

      t.timestamps
    end
    add_index :blocks, :user_id
  end
end
