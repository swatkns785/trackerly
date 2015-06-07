class CreateSchoolDistricts < ActiveRecord::Migration
  def change
    create_table :school_districts do |t|
      t.string :name, null: false
      t.string :website
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
      t.index :name
    end
  end
end
