# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  Restaurant.all.destroy()

Restaurant.create([
	{name: "Swiss Chalet", openhours: "13-23", location: "Everywhere", description: "Saucy"},
	{name: "Marben", openhours: "14-24", location: "King West", description: "Fancy"},
	{name: "Dumpling House", openhours: "12-22", location: "China Town", description: "Dumply"},
	{name: "King Noodle", openhours: "12-24", location: "China Town", description: "Noodly"},
	{name: "Fancy Franks", openhours: "14-21", location: "Everywhere", description: "Franky"},
])
