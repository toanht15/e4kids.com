# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:                  "Hoang The Toan",
 email:                 "thetoanpr04@gmail.com",
 password:              "hoangthetoan",
 age: 25, 
 gender: "Male",
 confirmed_at: Time.zone.now
)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  age = Faker::Number.between(15,50)
  gender = "Male" 
  User.create!(name:  name,
   email: email,
   password:              password,
   age: age,
   gender: gender,
   confirmed_at: Time.zone.now
   )
end


users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

10.times do |n|
  name = Faker::Lorem.word
  Subject.create(name: name)
end

Subject.all.each do |n|
  30.times do |m|
  word = Faker::Lorem.word
  mean = Faker::Lorem.sentence(2)
  Vocabulary.create(
    word: word,
    mean: mean,
    subject_id: n.id)
end
end

100.times do |m|
  Remember.create(
    user_id: 1,
    vocabulary_id: m+1,
    created_at: DateTime.now - (2+ Random.rand(6)).days)
end

User.all.each do |u|
  100.times do |m|
  Remember.create(
    user_id: u.id,
    vocabulary_id: m+1,
    created_at: DateTime.now - (2+ Random.rand(8)).days)
end
end