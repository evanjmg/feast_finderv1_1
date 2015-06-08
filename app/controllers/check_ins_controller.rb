class CheckInsController < ApplicationController
	before_action :require_signin
	before_action :set_place
	def create
		@place.visitors << current_user
		redirect_to @place, notice: "You checked in!"
	end
	def destroy
		check_in = current_user.check_ins.find(params[:id])
		check_in.destroy
		redirect_to @place
end

private
def set_place
	@place = Place.find_by!(slug: params[:place_id])
end
end
