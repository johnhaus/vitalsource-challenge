# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all

puts 'Creating users...'
user = User.new
user.name = 'Jim'
user.email = 'jim@email.com'
user.password = '111111'
user.sign_in_count = 4
user.save!

user = User.new
user.name = 'Bob'
user.email = 'bob@email.com'
user.password = '222222'
user.sign_in_count = 9
user.save!

user = User.new
user.name = 'Tom'
user.email = 'tom@email.com'
user.password = '333333'
user.sign_in_count = 0
user.save!

puts 'Finished'
