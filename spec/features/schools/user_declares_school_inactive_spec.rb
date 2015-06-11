require "rails_helper"

feature "a district admin declares a school inactive", %q(

  As a school district administrator
  I want to change a school's status to 'inactive'
  So that it's status is reflected as 'inactive'

  Acceptance Criteria:
  [x] I must be able to change the status on the edit form
  [x] Upon declaring a school 'inactive', I receive confirmation
  [ ] Only the district admin can change the status
  
) do

  let(:school) { FactoryGirl.create(:school) }

  context "as an authenticated district admin" do
    scenario "declare a school inactive" do
      sign_in_as(school.school_district.district_admin)

      visit school_district_school_path(school.school_district, school)
      expect(page).to have_content "Status: Active"

      visit edit_school_district_school_path(school.school_district, school)
      select "Inactive", from: "Status"
      click_button "Update School"

      expect(page).to have_content "Status: Inactive"
    end
  end
end
