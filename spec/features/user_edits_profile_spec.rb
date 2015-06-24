require 'rails_helper'

feature "user edits profile", %Q{
  As a user
  I want to edit my profile
} do
  # Acceptance Criteria:
  # I must specify a first name
  # I must specify a last name
  # I must specify an email
  # If I don't, I am presented with an
  # error message.

  let(:user) { FactoryGirl.create(:user) }

  scenario "provide valid edit information" do
    visit edit_user_path(user)
    fill_in "First Name", with: "Joseee"
    fill_in "Last Name", with: "Cuervooo"
    fill_in "Email", with: "jose@cuervo.com"
    click_on "Submit"

    expect(page).to have_content("User edited successfully.")
    expect(page).to have_content("Joseee Cuervooo")
  end

  scenario "provide invalid edit information" do
    visit edit_user_path(user)
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: ""
    click_on "Submit"

    expect(page).to have_content("User not edited successfully.")
    expect(page).to have_content("can\'t be blank")
  end
end
