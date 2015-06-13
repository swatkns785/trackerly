require "rails_helper"

describe SchoolDistrictInviteMailer do
  pending do
    let(:school_district) { FactoryGirl.create(:school_district) }
    let(:admin) { school_district.user }
    let(:invite) { FactoryGirl.create(:school_district_invite,
      school_district_id: school_district.id, sender_id: admin.id) }

    describe "new user invitation email" do
      let(:email) { SchoolDistrictInviteMailer.new_user_invitation(invite,
        'http://www.MockSignUpPath.com') }

      it "specifies the school district in the subject" do
        expected = "Invitation to join #{school_district.name} on Tracker.ly"
        expect(email.subject).to eq(expected)
      end
    end
  end
end
