require "rails_helper"

feature "user creates new school district", %q(
  As a school district administrator
  I want to create a school district
  So I can keep track of teacher/student performance

  Acceptance Criteria:
  [ ] I should be able to create my school district upon creating an account
  [ ] At default, nobody else should be the administrator for my school district
) do

  context "as an authenticated school administrator" do
    scenario "user creates school district" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      click_link 'New School District'

      fill_in 'Name', with: 'Boston Public Schools'
      fill_in 'Website', with: 'http://www.bps.org/'
      fill_in 'Address', with: '1635 Avenue Louis Pasteur'
      fill_in 'City', with: 'Boston'
      select 'MA', from: 'State'
      fill_in 'Zip Code', with: '02115'

      click_button 'Create School District'

      expect(page).to have_content('Successfully created new school district.')
      expect(page).to have_content('Boston Public Schools')
      expect(page).to have_content("District Administrator: #{user.name}")
      expect(page).to have_content('1635 Avenue Louis Pasteur')
      expect(page).to have_content('Boston, MA 02115')
    end
  end
end
