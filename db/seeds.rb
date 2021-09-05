require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



categories = Category.create([{title: 'Frontend'},
    {title: 'Backend'},
    {title: 'General Development'}
    ])

category_ids = Category.pluck(:id)

20.times do |index|
 Test.create!(title: Faker::ProgrammingLanguage.name,
              level: rand(4),
              category_id: category_ids.sample
              )
end

test_ids = Test.pluck(:id)

20.times do |index|
  Question.create!(body: Faker::Lorem.question(word_count: 4),
                   test_id: test_ids.sample
                  )
end    

question_ids = Question.pluck(:id)

20.times do |index|
  Answer.create!(body: Faker::Lorem.sentence(word_count: 4),
                 question_id: question_ids.sample
                )
end    


20.times do |index|
  User.create!(login: Faker::Internet.username,
               password: Faker::Internet.password,
               name: Faker::Name.name
               )
end

30.times do |index|
    UserTest.create!(user_id: rand(1..20),
                    test_id: rand(1..20),
                    result: 'OK'
                    )
end    