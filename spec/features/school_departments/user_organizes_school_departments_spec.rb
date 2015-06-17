require "rails_helper"

feature "organize school into departments", %q(

  As a school administrator
  I want to organize my school into departments
  So that we can be more organized

  Acceptance Criteria:
  [x] The functionality must link from a school's show page
  [x] Upon organizing the departments, I must see a confirmation message
  [x] I must declare a name for the department

  Reach Criteria:
  [ ] I must be able to add more fields to the form w/ AJAX

) do

  let(:school) { FactoryGirl.create(:school) }
  let(:district_member) { FactoryGirl.create(
    :school_district_membership, school_district: school.school_district) }
  let(:faculty_member) { FactoryGirl.create(
    :school_faculty_membership, school: school,
     school_district_membership: district_member) }

  context "as a school administrator" do
    scenario "create school departments" do
      sign_in_as(faculty_member.user)
      visit school_district_school_path(school.school_district, school)

      click_link "Edit School Departments"
      expect(page).to have_content "#{school.name} Departments"

      fill_in "Department Name", with: "Biology"
      click_button "Submit"

      expect(page).to have_content "School department(s) saved."
    end

    scenario "leave the field(s) blank" do
      sign_in_as(faculty_member.user)

      visit new_school_school_department_path(school)
      click_button "Submit"

      expect(page).to have_content "can't be blank"
    end
  end
end
