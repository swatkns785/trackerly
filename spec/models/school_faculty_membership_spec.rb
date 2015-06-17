require 'rails_helper'

RSpec.describe SchoolFacultyMembership, type: :model do
  it { should belong_to(:school_district_membership) }
  it { should belong_to(:school) }

  it { should have_valid(:school_id).when(5, 25) }
  it { should_not have_valid(:school_id).when(nil, '', 5.75) }

  it { should have_valid(:school_district_membership_id).when(5, 25) }
  it { should_not have_valid(:school_district_membership_id).when(
    'string', 5.75) }
end
