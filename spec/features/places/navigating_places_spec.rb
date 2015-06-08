describe "Navigating different place pages" do 
	it "navigate from the list to the place page" do
		place1 = Place.create!(place_attributes)
		visit places_url
		click_link place1.name
		expect(current_path).to eq(place_path(place1))
	end
	it "navigate from the place to the list page" do
		place1 = Place.create!(place_attributes)
		visit place_url(place1)
		click_link "All Restaurants"
		expect(current_path).to eq(places_path)
	end
end