class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integer
    add_index :users, :user_name, :unique => true
  end
end
