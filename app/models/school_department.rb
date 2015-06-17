class SchoolDepartment < ActiveRecord::Base
  belongs_to :school

  validates :school_id,
    presence: true,
    numericality: { only_integer: true }

  validates :name,
    presence: true,
    uniqueness: { scope: :school_id }
end
