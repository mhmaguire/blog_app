# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

User.find_or_create_by_email!(email: "default@blog.com", password: "password", password_confirmation: "password")


b = Blog.instance
puts 'get blog instance'
10.times do 
	puts "post created"
	b.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(5))
end