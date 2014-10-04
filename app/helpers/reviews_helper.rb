module ReviewsHelper

	def star_rating(rating)
		return rating if rating.class == String
		("★" * rating) +  "☆" * (5 - rating)
	end

end
