class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :name
      t.string :body
      t.integer :rating

      t.timestamps
    end
  end
end
