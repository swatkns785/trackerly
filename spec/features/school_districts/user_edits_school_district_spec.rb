require "rails_helper"

feature "district admin edits school district", %q(

  As a school district's administrator
  I want to edit my school district's information
  So I can maintain the most up to date information

  [ ] I must be able edit the school's information from the show page
  [ ] Upon editing, I see a notice confirming success

) do

  context "as an authenticated school district admin" do
    scenario "can edit a school district's information" do
      school_district = FactoryGirl.create(:school_district)
      sign_in_as(school_district.user)

      visit school_district_path(school_district)
      click_link "Edit District Information"

      fill_in "Name", with: "Detroit Public Schools"
      fill_in "Website", with: "http://google.com"
      click_button "Submit"

      expect(page).to have_content "You have successfully edited your school district."
      expect(page).to have_content "Detroit Public Schools"
    end
  end

  context "as an unauthenticated user" do
    scenario "cannot edit school district"
  end

end
