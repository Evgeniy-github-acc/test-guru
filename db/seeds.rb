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
  User.create!(login: Faker::Internet.username,
               password: Faker::Internet.password,
               name: Faker::Name.name
               )
  end

user  = User.first

tests = []
20.times do |index|
tests << Test.create!(title: Faker::ProgrammingLanguage.name,
              level: rand(3),
              category_id: categories.sample.id,
              author: user
              )
                
end


questions = []
20.times do |index|
  questions << Question.create!(body: Faker::Lorem.question(word_count: 4),
                   test_id: tests.sample.id
                  )
end    


20.times do |index|
  Answer.create!(body: Faker::Lorem.sentence(word_count: 4),
                 correct: [true, false].sample, 
                 question_id: questions.sample.id
                )
end    

