require "rails_helper"

feature 'a district administrator creates schools', %q(

  As a school district administrator
  I want to create schools for my district
  So that I can see what schools are in my district

  Acceptance Criteria:
  [x] I must be able to add schools from the school district page
  [x] I must be able to declare the school's type (elementary, middle, high)
  [x] A school must have a name and address, website optional
  [x] Upon successfully creating, I receive a notice confirming success

) do

  context "as an authenticated district admin" do
    scenario "user creates schools" do
      school_district = FactoryGirl.create(:school_district)
      sign_in_as(school_district.user)

      visit school_district_path(school_district)
      click_link "Add School"

      fill_in "Name", with: "Boston Latin School"
      fill_in "Website", with: "http://www.bls.org"
      fill_in "Address", with: "123 Main Street"
      fill_in "City", with: "Boston"
      select "MA", from: "State"
      fill_in "Zip Code", with: "02115"
      click_button "Create School"

      expect(page).to have_content "You have successfully added a school to your district."
      expect(page).to have_content "Boston Latin School"
      expect(page).to have_link "http://www.bls.org"
      expect(page).to have_content "123 Main Street"
      expect(page).to have_content "Boston, MA 02115"
      expect(page).to have_content "School District: #{school_district.name}"
      expect(page).to have_content "District Administrator: #{school_district.user.name}"
    end

    scenario "admin makes errors" do
      # school_district = FactoryGirl.create(:school_district)
      # sign_in_as(school_district.user)
      #
      # visit school_district_path(school_district)
      # click_link "Add School"
      #
      # click_button "Create School"
      #
      # expect(page).to have_content "can't be blank"
    end
  end

  context "as a non-administrator" do
    scenario "cannot create school"

  end
end
