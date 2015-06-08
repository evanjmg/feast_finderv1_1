
Place.create!([
	{

		name: "doug's diner",
			location: "Denver",
			price: 10.00,
			description: %{'An awesome diner for awesome people, yes all day crazy man'}.squish,
			meal_size: 3, 
			cuisine: "American",
			rating: 3,
			image_file_name:'placeholder.jpg'
		},
		{
		name: "Subway",
			location: "Denver",
			price: 5.00,
			meal_size: 2, 
			description: %{'5 dollar foot longs for days'}.squish,
			cuisine: "American",
			rating: 3,
			image_file_name:'placeholder.jpg'
		}])
User.create!([
  {
    name: "Evan Gillogley",
    email: "evanjmg@gmail.com",
    password: "secret",
    password_confirmation: "secret",
    admin: true
  },
  {
    name: "Gene Siskel",
    email: "gene@example.com",
    password: "secret",
    password_confirmation: "secret"
  },
  {
    name: "Peter Travers",
    email: "peter@example.com",
    password: "secret",
    password_confirmation: "secret"
  },
  {
    name: "Elvis Mitchell",
    email: "elvis@example.com",
    password: "secret",
    password_confirmation: "secret"
  }
])
American = Cuisine.create!(name: "American")