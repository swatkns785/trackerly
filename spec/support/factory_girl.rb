require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Bunk#{n}" }
    sequence(:last_name) { |n| "Moreland#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :school_district do
    association :user
    name 'Boston Public Schools'
    website 'http://www.bps.org/'
    address '1635 Avenue Louis Pasteur'
    city 'Boston'
    state 'MA'
    zip_code '02115'
  end

  factory :school do
    association :school_district
    name 'Boston Latin School'
    website 'http://www.bls.org'
    address '155 Mills Road'
    city 'Boston'
    state 'MA'
    zip_code '02115'
    school_type 'high school'
    status 'Active'
  end
end
