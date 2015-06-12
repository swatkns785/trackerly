class SchoolDistrictMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_district

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }

  validates :school_district_id,
    presence: true,
    numericality: { only_integer: true }
end
