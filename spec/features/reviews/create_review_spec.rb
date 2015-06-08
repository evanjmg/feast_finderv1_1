describe "Create a Review" do
	before do
  @user = User.create!(user_attributes)
  sign_in(@user)
end
it "successfully write a review" do 
	place = Place.new(place_attributes)
	visit new_place_review_path(place)
	 Review.new(review_attributes)
	fill_in 'Price', with: 3
	fill_in 'Meal Size', with: 3
	fill_in 'Comment', with: "Good place to eat man!"
	click_button "Submit a Review"
	expect(page).to have_text("Subway")
expect(page).to have_text(@user.name)
end

end	
