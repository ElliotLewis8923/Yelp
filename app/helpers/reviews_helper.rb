module ReviewsHelper

	def star_rating(rating)
		return rating if rating.class == String
		("★" * rating) +  "☆" * (5 - rating)
	end

	def created(time)
			elapsed = ( (Time.now - time)/60 ).round
		if elapsed < 60 
			num, unit = elapsed, 'minutes'
		elsif 60 < elapsed && 1440 > elapsed
			num, unit = (elapsed/60), 'hours'
		else
			num, unit = (elapsed/1440), 'days'
		end
			num == 1 ? unit.chop! : nil
		return "#{num} #{unit} ago" # The method looks disgusting; I'm sure there's a way to do it recursively.
	end

end
