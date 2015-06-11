class AddStatusToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :status, :string, null: false, default: "Active"
  end
end
