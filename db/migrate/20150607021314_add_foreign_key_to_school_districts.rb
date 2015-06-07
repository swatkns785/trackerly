class AddForeignKeyToSchoolDistricts < ActiveRecord::Migration
  def change
    add_foreign_key :school_districts, :users
  end
end
