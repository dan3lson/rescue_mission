require 'rails_helper'

feature "user creates an answer", %Q{
  As a user
  I want to answer an existing question
  So that I can help others
} do
  # Acceptance Criteria
  #
  # - I must go to a question show page
  # - I must see a form for creating a new answer
  # - I must see a description required fields
  let(:question) { FactoryGirl.create(:question) }

  scenario "\ncreate a question successfully" do
    visit question_path(question)
    fill_in "Description", with: "TequilaTequilaTequilaTequila"
    click_on "Submit"
    expect(page).to have_content("TequilaTequilaTequilaTequila")
  end
end
