require "rails_helper"

feature "a user invites someone to join school district on Tracker.ly", %q(

  As a school district administrator
  I want to invite people to join the school district
  So that they can take advantage of all of the great features

  Acceptance Criteria:
  [ ] I must be able to invite users from the school district show page
  [ ] Upon successfully sending an invite, I see a confirmation message

) do

  let(:school_district) { FactoryGirl.create(:school_district,
    name: "Awesome Sauce") }
  let(:unaffiliated_user) { FactoryGirl.create(:user,
    email: "awesome@sauce.com") }

  context "as a district administrator" do
    before(:each) do
      ActionMailer::Base.deliveries = []
    end

    scenario "invite non-user to join school district" do
      sign_in_as(school_district.district_admin)
      visit school_district_path(school_district)

      fill_in :email, with: "boom@boom.com"
      select "Teacher", from: "What type of account will this invitee have:"
      click_button "Send Invitation"

      expect(page).to have_content "Invitation sent."
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.last
      expect(email).to have_subject(
        "Invitation to join Awesome Sauce on Tracker.ly")
      expect(email).to deliver_to("boom@boom.com")
      expect(email).to have_body_text(
        "Click the following link to create a new account:")
    end

    scenario "invite existing user to join school district" do
      sign_in_as(school_district.district_admin)
      visit school_district_path(school_district)

      fill_in :email, with: unaffiliated_user.email
      click_button "Send Invitation"

      expect(page).to have_content "Invitation sent."
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.last
      expect(email).to have_subject(
        "Invitation to join Awesome Sauce on Tracker.ly")
      expect(email).to deliver_to(unaffiliated_user.email)
      expect(email).to have_body_text(
        "Click the following link to redeem your invitation:")
    end
  end

  context "as a non district-affiliated user" do
    scenario "cannot view invitation functionality" do
      sign_in_as(unaffiliated_user)
      visit school_district_path(school_district)

      expect(page).to_not have_content(
        "Enter an email address to invite users to this district.")
    end
  end
end
