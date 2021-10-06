require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: '5555@gmail.com',
         password: '123123',
         password_confirmation: '123123',
         type: 'Admin',
         first_name: 'Bilbo',
         last_name: 'Beggins',
  )

