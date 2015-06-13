class CreateSchoolDistrictInvites < ActiveRecord::Migration
  def change
    create_table :school_district_invites do |t|
      t.string :email
      t.integer :school_district_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token
      t.timestamps null: false
    end
    add_foreign_key :school_district_invites, :school_districts, column: :school_district_id
  end
end
