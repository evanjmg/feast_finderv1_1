class ReviewsController < ApplicationController
	before_action :require_signin, except: :index
	before_action :set_place 
	before_action :current_review, except: [:new, :create]
	def index
		@reviews = @place.reviews
	end
	def new
		@review = @place.reviews.new
	end
	def create
		@review = @place.reviews.new(review_params)
		@review.user = current_user
		if @review.save
			redirect_to place_path(@place), 
			notice: "Thank you for submitting a review!"
		else
			render :new
		end
	end
	def edit
		session[:return_to] ||= request.referer
	end
	def update
		if @review.update(review_params)
			redirect_to session.delete(:return_to), notice: "Successfully updated review"
		else
			render :edit
		end
	end
	def destroy
		@review.destroy
		redirect_to :back, notice: "Succesfully deleted your review"
	end


private
def set_place
	@place = Place.find_by!(slug: params[:place_id])
end
def review_params
	params.require(:review).permit(:meal_size, :price, :comment)
end
def current_review
	@review = current_user.reviews.find_by(params[:id])
end
end
