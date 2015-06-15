class AddTypeToSchoolDistrictInvite < ActiveRecord::Migration
  def change
    add_column :school_district_invites, :account_type, :string
  end
end
