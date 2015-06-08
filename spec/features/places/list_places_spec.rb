
describe "View all restaurants" do 
	it "View all restaurants" do
		place1 = Place.create!(place_attributes)
		visit places_url
		expect(page).to have_text(place1.name)
		expect(page).to have_text(place1.rating)
		expect(page).to have_text(place1.location)
		expect(page).to have_text(place1.description[0..10])

	end
end