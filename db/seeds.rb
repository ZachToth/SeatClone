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

puts "\nCreating users"
50.times do
	name = Faker::Name.name.split
	User.create!(
		first_name: 	name.first,
		last_name: 		name.last,
		email: 				Faker::Internet.email,
		password: 		"asdf;lkj"
	)
	print "|"
end

puts "\nCreating reservations"
1000.times do
	Reservation.create!(
		user_id: 				User.all.sample.id,
		restaurant_id: 	Restaurant.all.sample.id,
		party_size: 		[1,3,4,5,10,15].sample,
		date: 					rand(10.days).seconds.from_now,
		time: 					[2,3,4,5,5,6,7,9,].sample
	)
	print "|"
end
