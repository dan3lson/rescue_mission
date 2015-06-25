require 'rails_helper'

feature "user views all questions", %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  # Acceptance Criteria
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  let!(:question)  { FactoryGirl.create(:question) }
  let!(:question2) { FactoryGirl.create(:question) }
  let!(:question3) { FactoryGirl.create(:question) }

  scenario "view the title of each question" do
    visit questions_path
    expect(page).to have_content(question.title)
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question3.title)
  end

  scenario "view questions in order" do
    visit questions_path
  end
end
