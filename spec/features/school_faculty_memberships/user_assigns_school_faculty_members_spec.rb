require "rails_helper"

feature "assign faculty to schools", %q(

  As a school district administrator
  I want to assign teachers to schools in the district
  So that the right staff can be accurately represented

  Acceptance Criteria:
  [x] I must be able to make assignments from the school district page.
  [ ] Only a district administrator can make the assignments.
  [x] I can only assign staff members who are members of the district.
  [x] I must see a message confirming the assignments.
  [x] I must be able to assign more than one teacher at a time.

) do

  let(:school_district) { FactoryGirl.create(:school_district) }
  let(:district_member) { FactoryGirl.create(
    :school_district_membership, school_district_id: school_district.id) }

  let(:member_of_another_district) { FactoryGirl.create(
    :school_district_membership) }

  context "as a school district administrator" do
    scenario "assign staff to schools" do
      school1 = FactoryGirl.create(:school, school_district: school_district)
      school2 = FactoryGirl.create(:school, school_district: school_district)
      member1 = FactoryGirl.create(
        :school_district_membership, school_district: school_district)
      member2 = FactoryGirl.create(
        :school_district_membership, school_district: school_district)

      SchoolFacultyMembership.create(
        school_id: school1.id, school_district_membership_id: member2.id)

      sign_in_as(school_district.district_admin)
      visit school_district_path(school_district)

      click_link "Staffing Assignments"
      click_link "Edit Staffing Assignments"

      expect(page).to have_content(
        "Use the form below to assign district faculty to their respective")
      expect(page).to_not have_content member_of_another_district.user.name

      select "#{school1.name}", from: member1.user.name
      select "#{school2.name}", from: member2.user.name
      click_button "Save School Assignments"

      expect(page).to have_content "School faculty assignments are saved."
      expect(SchoolFacultyMembership.all.count).to eq(2)
    end
  end

  context "as a school district member but not an admin" do
    scenario "cannot update school faculty memmberships" do
      sign_in_as(district_member.user)
      visit school_district_path(school_district)

      expect(page).to_not have_link "Staffing Assignments"
    end
  end

end
