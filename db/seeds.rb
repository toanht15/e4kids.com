 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "admin",
             email: "admin@test.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

User.create!(name:  "Hoang The Toan",
             email: "toanht@email.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

User.create!(name: "The Toan",
              email: "thetoanpr04@gmail.com",
              password: "123456",
              password_confirmation: "123456")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


5.times do |n|
  name = Faker::Lorem.word
  description = Faker::Lorem.paragraph(3)
  Course.create(
    name: name,
    description: description)
end

Course.all.each do |n|
  10.times do |w|
  content = Faker::Lorem.word
  category_id = n.id
  Word.create(
    content: content,
    course_id: category_id)
end
end

Word.all.each do |n|
  k = Random.rand(3)+1
  4.times do |t|
    content = Faker::Lorem.word
    if t == k 
      correct = true
    else
      correct = false
    end
    Option.create(
      content: content,
      correct: correct,
      word_id: n.id)
  end
end