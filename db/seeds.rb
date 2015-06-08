# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create!([
	{

		name: "doug's diner",
			location: "Denver",
			price: 10.00,
			description: 'An awesome diner for awesome people, yes all day crazy man',
			meal_size: 3, 
			cuisine: "American",
			rating: 3,
			image_file_name:'placeholder.jpg'
		},
		{
		name: "Subway",
			location: "Denver",
			price: 5.00,
			description: '5 dollar foot longs for days'
			cuisine: "American",
			rating: 3,
			image_file_name:'placeholder.jpg'
		}])