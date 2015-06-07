class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :website
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.integer :school_district_id, null: false

      t.timestamps null: false
    end
    add_index :schools, :name
    add_foreign_key :schools, :school_districts
  end
end
