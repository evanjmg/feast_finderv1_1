require 'spec_helper'

describe "Checking in to a place" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "checking in and out" do
    place = Place.create!(place_attributes)

    visit place_url(place)

    expect(page).to have_text("0 fans")

    expect {
      click_button 'Check-in'
    }.to change(@user.check_ins, :count).by(1)

    expect(current_path).to eq(place_path(place))

    expect(page).to have_text("YOU CHECKED IN!")
    expect(page).to have_text("1 Check in")
    expect(page).to have_button("You've Checked in")
  end
end