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
    sequence(:name) { |n| "Boston Latin School #{n}" }
    website 'http://www.bls.org'
    address '155 Mills Road'
    city 'Boston'
    state 'MA'
    zip_code '02115'
    school_type 'high school'
    status 'Active'
  end

  factory :school_district_invite do
    association :school_district
    email 'jimmy.mcnulty@baltimore.com'
    sender_id '5'
    token '12345678902345678901'
  end

  factory :school_district_membership do
    association :user
    association :school_district
  end

  factory :school_faculty_membership do
    association :school_district_membership
    association :school
  end
end
