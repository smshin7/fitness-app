# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
	first_name: "Scott",
	last_name: "Shin",
  age: 21,
  gender: "male",
  email: "scott@scott.co",
  height: 180,
  weight: 160,
  location: "Los Angeles",
  gym: "Golds",
  goal: "Weight Loss"
  )