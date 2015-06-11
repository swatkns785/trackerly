require 'rails_helper'

RSpec.describe School, type: :model do
  it { should belong_to(:school_district) }

  it { should have_valid(:name).when('Boston Latin School') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:website).when('http://www.google.com') }
  it { should_not have_valid(:website).when('htp:google', '.com', 'google') }

  it { should have_valid(:address).when('14 Boston Street') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Boston', 'Dedham') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'NY') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('02115', '02111-2115') }
  it { should_not have_valid(:zip_code).when(nil, '', '123') }

  it { should have_valid(:school_district_id).when(5, 25) }
  it { should_not have_valid(:school_district_id).when(nil, '', 'yo')}

  it { should have_valid(:school_type)
    .when('high school', 'elementary school', 'middle school', 'other') }

  it { should have_valid(:status).when("Active", "Inactive") }
  it { should_not have_valid(:status).when(nil, '', "random string") }
end
