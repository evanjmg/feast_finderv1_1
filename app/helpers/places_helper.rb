module PlacesHelper

	def format_rating(place)
		if place.rating.blank?
			"No reviews"
		else
			place.rating
		end
	end
	def format_meal_size(place)
		if place.average_meal_size.blank?
			"No reported meal sizes"
		else
			place.average_meal_size
		end
	end
	def format_price(place)
		if place.average_price.blank?
			"No listed price"
		else
			number_to_currency(place.average_price)
		end
	end
	def image_for(place)
		if place.image_file_name.blank?
			image_tag 'placeholder.jpg'
		else
			image_tag(place.image_file_name)
		end
	end
end
