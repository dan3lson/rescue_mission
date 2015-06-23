require 'rails_helper'

feature "user signs up", %Q{
  As a visitor
  I want to sign up
} do
  # Acceptance Criteria:
  # I must specify a first name
  # I must specify a last name
  # I must specify an email
  # If I don't, I am presented with an
  # error message.

  scenario "provide valid sign up information" do
    visit users_path
    click_on "Sign Up"
    fill_in "First Name", with: "Jose"
    fill_in "Last Name", with: "Cuervo"
    fill_in "Email", with: "jose@cuervo.com"
    click_on "Submit"

    #expect(page).to have_content("User created successfully.")
    expect(page).to have_content("Jose Cuervo")
  end

  scenario "provide invalid sign up information" do
    visit users_path
    click_on "Sign Up"
    click_on "Submit"

    #expect(page).to have_content("User not created successfully.")
    expect(page).to have_content("can\'t be blank")
  end
end
