class CreateSchoolDepartments < ActiveRecord::Migration
  def change
    create_table :school_departments do |t|
      t.string :name, null: false
      t.integer :school_id, null: false
      t.timestamps null: false
    end
  end
end
