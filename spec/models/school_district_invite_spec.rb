require 'rails_helper'

RSpec.describe SchoolDistrictInvite, type: :model do
  pending 'these need to be fixed' do
    it { should belong_to(:school_district_membership) }
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:recipient).class_name('User') }
    it { should belong_to(:school_district) }

    it { should have_valid(:email).when('anthony.jones@gmail.com',
      'jane.watson@yahoo.com') }
    it { should_not have_valid(:email).when(nil, 'jane', '.com', 'jane@net',
      'anthony.com') }
  end
end
