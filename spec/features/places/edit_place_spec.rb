describe "Editing a Restaurant" do
 before do
  admin = User.create!(user_attributes(admin: true))
  signin_path(admin)
end 
  it "updates the restaurant and shows its details" do
    place = Place.create(place_attributes)
    
    visit place_url(place)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_place_path(place))
        
    expect(find_field('Name').value).to eq(place.name)
    fill_in 'Name', with: "Updated Name"

    click_button 'Update'

    expect(current_path).to eq(place_path(place))

    expect(page).to have_text('Updated Name')
  end
  
end