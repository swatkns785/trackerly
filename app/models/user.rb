class User < ActiveRecord::Base
  has_one :school_district

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

  validates :role,
    presence: true,
    inclusion: { in: ["district-admin", "school-admin", "teacher", "student"] }
end
