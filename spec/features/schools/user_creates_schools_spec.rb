require "rails_helper"

feature 'a district administrator creates schools', %q(

  As a school district administrator
  I want to create schools for my district
  So that I can see what schools are in my district

  Acceptance Criteria:
  [ ] I must be able to add schools from the school district page w/ AJAX
  [ ] I must be able to declare the school's type (elementary, middle, high)
  [ ] A school must have a name, address, principal, principal's email address
  [ ] Upon successfully creating, I receive a notice confirming success

) do

  context "as an authenticated district admin" do
    scenario "user creates schools" do

    end
  end

  context "as a non-administrator" do
    scenario "cannot create schools" do
    
    end
  end
end
