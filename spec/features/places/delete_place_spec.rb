

describe "Deleting a restaurant" do
  before do
  admin = User.create!(user_attributes(admin: true))
  signin_path(admin)
end
  it "destroys the restaurant and shows the listing without it" do
    place = Place.create(place_attributes)
    visit place_path(place)

    click_link 'Delete'

    expect(current_path).to eq(places_path)
    expect(page).not_to have_text(place.description[0..10])
  end
end