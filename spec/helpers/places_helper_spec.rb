require 'spec_helper'
describe PlacesHelper do
  it "placeholder image if no image is entered" do
  	place1 = Place.create!(place_attributes(image_file_name:''))
	visit place_url(place1)

  	expect(page).to have_selector("img[src$='placeholder.jpg']")
  end
end
