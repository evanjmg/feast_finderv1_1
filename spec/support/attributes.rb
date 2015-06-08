def place_attributes(overrides ={})
	{
		name: "doug's diner",
			location: "Denver",
			price: 10.00,
			description: 'An awesome diner for awesome people, yes all day crazy man',
			meal_size: 3, 
			cuisine: "American",
			rating: 3,
			image_file_name:'placeholder.jpg'
		}.merge(overrides)
end
def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret123",
    password_confirmation: "secret123",
    admin: false
    }.merge(overrides)
end
def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end
def review_attributes(overrides = {})
  {
    price: 4,
    meal_size: 3,
    comment: "Decent food"
  }.merge(overrides)
end