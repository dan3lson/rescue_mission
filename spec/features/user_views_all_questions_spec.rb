require 'rails_helper'

feature "user views all questions", %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario "view the title of each question" do
    visit questions_path

  end

  scenario "view questions in order" do
    visit questions_path

  end
end
