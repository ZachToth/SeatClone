# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  Restaurant.all.destroy()
puts "\nCreating Restaurants"
50.times do
	Restaurant.create!(
		name:      Faker::Company.name,
		openhours: ["12-24", "10-20", "11-23", "10-24", "8-18"].sample,
		location: ["King West", "King East", "China Town", "North York", "Liberty Village",].sample,
		description: Faker::Hacker.say_something_smart,
		cuisine: ["Chinese", "Thai", "Vietnamese", "Continental", "Mexican", "French", "Asian Fusion"].sample,
		capacity: [10, 15, 20, 25, 30, 35, 40, 45, 50].sample 
	)
	print "|"
end

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
