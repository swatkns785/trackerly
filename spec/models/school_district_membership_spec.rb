require 'rails_helper'

RSpec.describe SchoolDistrictMembership, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:school_district) }

  it { should have_valid(:user_id).when(5, 25) }
  it { should_not have_valid(:user_id).when(nil, '', 'string') }

  it { should have_valid(:school_district_id).when(5, 25) }
  it { should_not have_valid(:school_district_id).when(nil, '',
    'string') }
end
