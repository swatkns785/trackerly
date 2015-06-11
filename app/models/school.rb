class School < ActiveRecord::Base
  belongs_to :school_district

  validates :name,
    presence: true

  validates_format_of :website, :with => URI::regexp(%w(http https))

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

  validates :school_district_id,
    presence: true,
    numericality: { only_integer: true }

  validates :status,
    presence: true,
    inclusion: { in: %w(Active Inactive) }
end
