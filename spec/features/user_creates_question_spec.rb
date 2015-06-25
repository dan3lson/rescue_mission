require 'rails_helper'

feature "user creates a question", %Q{
  As a user
  I want to create a new question
  So that I can get help from others
} do
  # Acceptance Criteria
  #
  # - I must go to the new question page
  # - I must see a form for creating a new question
  # - I must see a user, title, and description required fields
  let!(:user) { FactoryGirl.create(:user) }

  scenario "\ncreate a question successfully" do
    visit new_question_path
    fill_in "Title", with: "TequilaCoco"
    fill_in "Description", with: "TequilaTequilaTequilaTequila"
    select user.first_name, from: "User"
    click_on "Submit"
    expect(page).to have_content("TequilaCoco")
  end

  scenario "create question unsuccessfully" do
    # visit questions_path
  end
end
