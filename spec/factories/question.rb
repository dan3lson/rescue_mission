FactoryGirl.define do
  sequence :question do |n|
    title "Tequila #{n}"
    description "What is tequila?"
    user_id n
  end
end
