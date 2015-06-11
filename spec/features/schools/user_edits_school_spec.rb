require "rails_helper"

feature "district admin edits school info", %q(

  As a school district administrator
  I want to edit a school's information
  So that I can change the details of the school

  Acceptance Criteria:
  [ ] I must be able to edit a school's information from a school district page w/ AJAX
  [ ] Upon successfully editing, I receive a notice confirming success

) do
  let(:school) { FactoryGirl.create(:school) }

  context "as a school district administrator" do
    scenario "successfully edit a school district's info" do
      sign_in_as(school.school_district.district_admin)

      visit school_district_school_path(school.school_district, school)
      click_link "Edit School Info"

      fill_in "Name", with: "Some other school"
      fill_in "Address", with: "123 Main Street"
      fill_in "City", with: "Not Boston"
      click_button "Update School"

      expect(page).to have_content "You have successfully updated this school."
      expect(page).to have_content "Some other school"
      expect(page).to have_content "Not Boston"
      expect(page).to have_content "123 Main Street"
    end

    scenario "leaves forms blank" do
      sign_in_as(school.school_district.district_admin)

      visit edit_school_district_school_path(school.school_district, school)

      fill_in "Name", with: ""
      fill_in "Address", with: ""
      fill_in "City", with: ""
      click_button "Update School"

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "Fill out the forms correctly."
    end
  end
end
