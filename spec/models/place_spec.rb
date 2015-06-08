

describe Place do
#   it "sorted list of places by price asc" do
#   sorted_array = [place_attributes(price:10), place_attributes(price: 12),place_attributes(price:9)]
#   	new_array = []
#   	# sorted_array.each do |a|
#   	# 	Place.new(a) = new_array.push
#   	# end
# expect(new_array).to eq(sorted_array.order('price asc'))
# end
  before do
  @user = User.create!(user_attributes)
  sign_in(@user)
end
it "has check-ins" do
  place = Place.new(place_attributes)
  user1 = User.new(user_attributes(email: "larry@example.com"))
  user2 = User.new(user_attributes(email: "moe@example.com"))

  place.check_ins.new(user: user1)
  place.check_ins.new(user: user2)

  expect(place.visitors).to include(user1)
  expect(place.visitors).to include(user2)
end
it "generates a slug when it's created" do
  place = Place.create!(place_attributes(name: "subway restaurant"))

  expect(place.slug).to eq("subway-restaurant")
end

it "requires a unique title" do
  place1 = Place.create!(place_attributes)

  place2 = Place.new(title: place1.title)
  place2.valid? # populates errors
  expect(place2.errors[:title].first).to eq("has already been taken")
end

it "requires a unique slug" do
  place1 = Place.create!(place_attributes)

  place2 = Place.new(slug: place1.slug)
  place2.valid? # populates errors
  expect(place2.errors[:slug].first).to eq("has already been taken")
end 
end
