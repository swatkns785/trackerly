require 'rails_helper'

RSpec.describe SchoolDistrict, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:schools) }

  it { should have_valid(:name).when('Boston Public Schools') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:address).when('123 Main Street') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Boston', 'New York City') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'NY') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('02111', '20006') }
  it { should_not have_valid(:zip_code).when(nil, '', '123') }

  it { should have_valid(:user_id).when(5, 25) }
  it { should_not have_valid(:user_id).when(nil, '', 8.75) }
end
