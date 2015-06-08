

describe "Show restaurant" do 
	it "Show restaurant" do
		place1 = Place.create!(place_attributes)
		visit place_url(place1)
		expect(page).to have_text(place1.name)
		expect(page).to have_text(place1.rating)
		expect(page).to have_text(place1.location)
		expect(page).to have_text(place1.description[0..10])

	end
	it "includes the restaurant's name in the page title" do
	place = Place.create!(place_attributes)

  visit place_url(place)

  expect(page).to have_title("#{place.name}")
end
it "has an SEO-friendly URL" do
  place = place.create!(place_attributes(name: "Dude"))
  visit place_url(place)
  expect(current_path).to eq("/places/dude")
end
end