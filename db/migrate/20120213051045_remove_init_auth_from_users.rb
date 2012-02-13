class RemoveInitAuthFromUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :username
      t.remove :password
    end
  end

  def down
    change_table :users do |t|
      t.add_column :username, :string
      t.add_column :password, :string
    end
  end
end
