require 'spec_helper'
describe "Creating a new restaurant" do
  
before do
  admin = User.create!(user_attributes(admin: true))
  signin(admin)

  @cuisine1 = Cuisine.create!(name: "Cuisine 1")
  @cuisine2 = Cuisine.create!(name: "Cuisine 2")
  @cuisine3 = Cuisine.create!(name: "Cuisine 3")
end
 
  it "saves the restaurant and shows its details" do
    visit places_url

    click_link "plus-icon"

    expect(current_path).to eq(new_place_path)

    fill_in "Name", with: "New Place"
    fill_in "Description", with: "Yummy food that is the best in the world, everyone!"
    fill_in "Meal size", with: 2
    fill_in "Price", with: 5
    fill_in "Rating", with: 4
    fill_in "Cuisine", with: 'Chinese'

    click_button 'Create Place'
    check(@cuisine1.name)
    check(@cuisine2.name)
    expect(page).to have_text(@cuisine1.name)
  expect(page).to have_text(@cuisine2.name)
  expect(page).not_to have_text(@cuisine3.name)
    expect(current_path).to eq(place_path(Place.last))
    expect(page).to have_text('New Place')
  end
end