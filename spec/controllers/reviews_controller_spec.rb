require 'spec_helper'

describe ReviewsController do

  before do
    @place = Place.create!(place_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot access new" do
      get :new, place_id: @place

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access create" do
      post :create, place_id: @place

      expect(response).to redirect_to(new_session_url)
    end
  
end
end
