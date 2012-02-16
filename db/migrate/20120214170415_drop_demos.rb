class DropDemos < ActiveRecord::Migration
  def up
    drop_table :demos
  end

  def down
  end
end
