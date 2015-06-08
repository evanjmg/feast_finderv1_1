class PlacesController < ApplicationController

before_action :require_signin, except: [:index, :show]
before_action :require_admin, except: [:index, :show]
before_action :set_place, only: [:show, :edit, :update,:destroy]
def index
		if params[:scope].in? %w(lowest_price highest_price largest_meal)
    @place = Place.send(params[:scope])
		else
		@places = Place.all
		end
	end
	def show
		
		@cuisines = @place.cuisines
		@visitors = @place.visitors
		if current_user
		@current_check_in = current_user.check_ins.find_by(place_id: @place.id)
		@current_review = current_user.reviews.find_by(place_id: @place.id)
		
	end
	end
	def edit
		
	end
	def update
		place_params
		if @place.update(place_params)
		redirect_to @place, notice: "Succesfully updated #{@place.name}"
	else 
		render :edit
	end
	end
	def new
		@place = Place.new
	end
	def create
		place_params
		@place = Place.new(place_params)
		if @place.save
		redirect_to @place, notice: "Succesfully created #{@place.name}"
	else
		render :new
	end
	end
	def destroy
		@place.destroy
		redirect_to places_url, notice: "Succesfully deleted #{@place.name}"
	end
end


private
def place_params 
	 params.require(:place).
	 permit(:name, :location, :description, :meal_size, :rating, :image_file_name, cuisine_ids: [])
end
def set_place
@place = Place.find_by!(slug: params[:id])
	end

