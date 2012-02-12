class AddDayToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :day, :string
  end
end
