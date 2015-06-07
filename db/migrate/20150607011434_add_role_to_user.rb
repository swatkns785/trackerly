class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "district-admin"
  end
end
