class RemoveRoleFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string, default: "district-admin", null: false
  end
end
