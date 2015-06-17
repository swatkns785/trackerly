require 'rails_helper'

RSpec.describe SchoolDepartment, type: :model do
  it { should belong_to(:school) }

  it { should have_valid(:name).when("Science", "Mathematics") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:school_id).when(5, 25) }
  it { should_not have_valid(:school_id).when(7.57, nil, '', "string") }
end
