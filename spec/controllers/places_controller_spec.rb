

require 'spec_helper'

describe PlacesController do

  before do
    @place = Place.create!(place_attributes)
  end

  context "when not signed in as an admin user" do

    before do
      non_admin = User.create!(user_attributes(admin: false))
      session[:user_id] = non_admin.id
    end

    it "cannot access new" do
      get :new

      expect(response).to redirect_to(root_url)
    end

    it "cannot access create" do
      post :create

      expect(response).to redirect_to(root_url)
    end

    it "cannot access edit" do
      get :edit, id: @place

      expect(response).to redirect_to(root_url)
    end

    it "cannot access update" do
      patch :update, id: @place

      expect(response).to redirect_to(root_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @place

      expect(response).to redirect_to(root_url)
    end

  end

end
