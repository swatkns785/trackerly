class CreateSchoolDistrictMemberships < ActiveRecord::Migration
  def change
    create_table :school_district_memberships do |t|
      t.integer :school_district_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
