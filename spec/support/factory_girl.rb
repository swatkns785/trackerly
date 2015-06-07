require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "Bunk#{n}"}
    sequence(:last_name) {|n| "Moreland#{n}"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

end
