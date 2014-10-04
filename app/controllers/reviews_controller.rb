class ReviewsController < ApplicationController

	before_action :authenticate_user!

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		if @restaurant.reviews.find_by(user_id: current_user.id).nil?
			@review = Review.new
		else
			flash[:notice] = "Sorry, you have already reviewed this restaurant."
			redirect_to restaurants_path
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id]) 
		@review = @restaurant.reviews.create(params[:review].permit(:thoughts, :rating))
		@review.user_id = current_user.id
		@review.save
		redirect_to restaurants_path	
		end
	end

end
