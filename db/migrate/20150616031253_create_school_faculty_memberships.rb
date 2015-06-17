class CreateSchoolFacultyMemberships < ActiveRecord::Migration
  def change
    create_table :school_faculty_memberships do |t|
      t.integer :school_id, null: false
      t.integer :school_district_membership_id, null: false
      t.timestamps null: false
    end
  end
end
