# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating Users"
puts "============================"

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email
  )
end

User.all.each do |user|
  puts "#{user.first_name} #{user.last_name} #{user.email} "
end

puts "Creating Questions"
puts "============================"

50.times do
  Question.create!(
    title: Faker::Lorem.words(4).join(" "),
    description: Faker::Lorem.sentence,
    user_id: User.all.sample.id
  )
end

Question.all.each do |question|
  puts "#{question.title} #{question.description} #{question.user_id} "
end

puts "Creating Answers"
puts "============================"

50.times do
  Answer.create!(
    description: Faker::Hacker.say_something_smart,
    question_id: Question.all.sample.id
  )
end

Answer.all.each do |answer|
  puts "Description: #{answer.description}, Question ID: #{answer.question_id}"
end
