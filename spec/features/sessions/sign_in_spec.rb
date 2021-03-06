require 'spec_helper'

describe "Signing in" do

  it "prompts for an email and password" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end
  it "redirects to the intended page" do
  user = User.create!(user_attributes)

  visit users_url

  expect(current_path).to eq(new_session_path)

  signin_path(user)

  expect(current_path).to eq(users_path)
end

it "signs in the user if the email/password combination is valid" do
  user = User.create!(user_attributes)

  visit root_url

  click_link 'Sign In'

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button 'Sign In'

  expect(current_path).to eq(user_path(user))   

  expect(page).to have_text("Welcome back, #{user.name}!")
end

it "does not sign in the user if the email/password combination is invalid" do
  user = User.create!(user_attributes)

  visit root_url

  click_link 'Sign In'

  fill_in "Email", with: user.email
  fill_in "Password", with: "no match"

  click_button 'Sign In'

  expect(page).to have_text('Invalid')
end
end