describe "Delete a Review" do
	before do
  @user = User.create!(user_attributes)
  sign_in(@user)
end
it "successfully delete a review" do 
	place = Place.new(place_attributes)
	review = Review.new(review_attributes)
	visit place_url(place)
	click_link 'Delete'
	expect(page).to_not have_text("Subway")
expect(page).to have_text(@user.name)
end

end	