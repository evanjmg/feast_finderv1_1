describe "Edit a Review" do
	before do
  @user = User.create!(user_attributes)
  sign_in(@user)
end
it "successfully edit and update a review" do 
	place = Place.new(place_attributes)
	review = Review.new(review_attributes)
	visit place_url(place)
	click_link 'Edit'
	expect(page).to have_text("Edit Review")
	fill_in 'Price', with: 3
	fill_in 'Meal Size', with: 3
	fill_in 'Comment', with: 'Great place to eat man!'
	click_button 'Post a Review'
end

end	