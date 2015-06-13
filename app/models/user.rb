class User < ActiveRecord::Base
  has_many :school_districts
  has_many :school_district_memberships
  has_many :invitations, class_name: "SchoolDistrictInvite",
    foreign_key: "recipient_id"

  has_many :sent_invites, class_name: "SchoolDistrictInvite",
    foreign_key: "sender_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :sign_up }

  validates :password,
    presence: true

  validates :password_confirmation,
    presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
