

describe "Viewing a list of reviews" do

  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "shows the reviews for a specific place" do
    place1 = Place.create!(place_attributes(name: "Subway"))
    review1 = place1.reviews.create!(review_attributes(comment: "Loved it so much", user: @user))
    review2 = place1.reviews.create!(review_attributes(comment: "Liked it so much", user: @user))


    place2 = Place.create!(place_attributes(name: "Superplace"))
    review3 = place2.reviews.create!(review_attributes(comment: "Boo!", user: @user))

    visit place_reviews_url(place1)

    expect(page).to have_text(review1.comment)
    expect(page).to have_text(review2.comment)
    expect(page).not_to have_text(review3.comment)
  end
end	