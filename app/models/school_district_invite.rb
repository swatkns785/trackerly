class SchoolDistrictInvite < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :school_district_membership
  belongs_to :school_district, foreign_key: "school_district_id"

  before_create :generate_token

  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :sender_id,
    numericality: { only_integer: true }

  validates :school_district_id,
    numericality: { only_integer: true }

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.school_district_id, Time.now,
      rand].join)
  end
end
