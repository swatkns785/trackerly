require "rails_helper"

feature "a user views all school faculty membership assingments", %q(

  As a user
  I want to view all of school faculty memberships
  So that I can see who is assigned to what school

  Acceptance Criteria:
  [x] I must view the faculty assignments on the index page
  [x] They must be organized by school, which are organized alphabetically
  [x] The school titles must link to their respective school pages

) do

  context "as a district administartor" do
    scenario "can view all faculty assignments" do
      school_district = FactoryGirl.create(:school_district)

      first_school = FactoryGirl.create(
        :school, school_district: school_district, name: "Bilbo Baggins School")
      second_school = FactoryGirl.create(
        :school, school_district: school_district, name: "Albus Dumbledore School")

      membership1 = FactoryGirl.create(:school_district_membership, school_district: school_district)
      membership2 = FactoryGirl.create(:school_district_membership, school_district: school_district)

      faculty1 = FactoryGirl.create(:school_faculty_membership, school_district_membership: membership1, school: first_school)
      faculty2 = FactoryGirl.create(:school_faculty_membership, school_district_membership: membership2, school: second_school)

      sign_in_as(school_district.district_admin)
      visit school_district_school_faculty_memberships_path(school_district)

      expect(page).to have_link first_school.name
      expect(page).to have_content faculty1.school_district_membership.user.name

      first_school_name_location = page.body.index(first_school.name)
      second_school_name_location = page.body.index(second_school.name)
      district_member1_name_location = page.body.index(faculty1.school_district_membership.user.name)
      district_member2_name_location = page.body.index(faculty2.school_district_membership.user.name)

      expect(second_school_name_location).to be < first_school_name_location
      expect(second_school_name_location).to be < district_member1_name_location
      expect(first_school_name_location).to be < district_member1_name_location
      expect(second_school_name_location).to be < district_member2_name_location
    end
  end
end
