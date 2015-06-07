class SchoolDistrict < ActiveRecord::Base
  belongs_to :user

  validates :user,
    presence: true

  validates :name,
    presence: true

  validates :address,
    presence: true

  validates :city,
    presence: true

  validates :state,
    presence: true

  validates :zip_code,
    presence: true

  validates_format_of :zip_code,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "should be 12345 or 12345-1234"

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }

  def district_admin
    user
  end
end
