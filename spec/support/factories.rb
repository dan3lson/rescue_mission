FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "First Name #{n}" }
    sequence(:last_name) { |n| "Last Name #{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
  end

  factory :question do
    sequence(:title) { |n| "Tequila #{n}" }
    description "What is tequila?"
    user
  end

  factory :answer do
    description "descriptiondescriptiondescriptiondescriptiondescriptiondescription"
    question
    # create user and question relationships
  end
end
