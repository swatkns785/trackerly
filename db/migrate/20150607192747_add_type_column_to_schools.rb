class AddTypeColumnToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :type, :string
  end
end
