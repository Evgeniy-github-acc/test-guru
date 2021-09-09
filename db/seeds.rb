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

20.times do |index|
 Test.create!(title: Faker::ProgrammingLanguage.name,
              level: rand(4),
              category_id: Category.ids.sample
              )
end


20.times do |index|
  Question.create!(body: Faker::Lorem.question(word_count: 4),
                   test_id: Test.ids.sample
                  )
end    


20.times do |index|
  Answer.create!(body: Faker::Lorem.sentence(word_count: 4),
                 question_id: Question.ids.sample
                )
end    


20.times do |index|
  User.create!(login: Faker::Internet.username,
               password: Faker::Internet.password,
               name: Faker::Name.name
               )
end

30.times do |index|
    TestsUser.create!(user_id: User.ids.sample,
                       test_id: Test.ids.sample
                    )
end    