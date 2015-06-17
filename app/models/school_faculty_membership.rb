class SchoolFacultyMembership < ActiveRecord::Base
  belongs_to :school_district_membership
  belongs_to :school

  validates :school_id,
    presence: true,
    numericality: { only_integer: true }

  validates :school_district_membership_id,
    presence: true,
    numericality: { only_integer: true }

  def user
    school_district_membership.user
  end

  def user_name
    school_district_membership.user.name
  end
end
