require 'spec_helper'

describe "Viewing a user's profile page" do

  it "shows the user's details" do
    user = User.create!(user_attributes)
  sign_in(user)
  
    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)
  end
it "includes the user's name in the page title" do
  user = User.create!(user_attributes)

  signin(user)

  visit user_url(user)

  expect(page).to have_title("#{user.name}")
end
end