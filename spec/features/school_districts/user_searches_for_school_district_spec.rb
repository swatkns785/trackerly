require "rails_helper"

feature "a user searches for a school district", %q(

  As a user
  I want to search for a school district
  So that I can view it's details

  Acceptance Criteria
  [x] I must be able to find the school district from the home page
  [x] I must only see results that match my query
  [ ] If there are no matches, I must be notified that there are not matches

) do

  before :each do
    @district1 = FactoryGirl.create(:school_district, name: "District 1")
    @district2 = FactoryGirl.create(:school_district, name: "District 2")
    @district3 = FactoryGirl.create(:school_district, name: "District 3")
    @district4 = FactoryGirl.create(:school_district, name: "random string")
  end

  context "as an ordinary user" do
    scenario "search for a school districts" do
      visit root_path
      fill_in :query, with: "District"
      click_button "Search"

      expect(page).to have_link @district1.name
      expect(page).to have_link @district2.name
      expect(page).to have_link @district3.name
      expect(page).to_not have_link @district4.name
    end
  end
end
