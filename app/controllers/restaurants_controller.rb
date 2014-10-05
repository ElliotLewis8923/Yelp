class RestaurantsController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :index]  

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :description, :image))
		@restaurant.user_id = current_user.id
		@restaurant.save
		redirect_to restaurants_path
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user_id == current_user.id
			render 'edit'
		else
			redirect_to restaurants_path
		end
	end

	def update
		@restaurant = Restaurant.find(params[:id])


		if @restaurant.update(params[:restaurant].permit(:name, :description, :image))
			redirect_to restaurants_path
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user_id == current_user.id
			@restaurant.destroy
			redirect_to restaurants_path
		else
			redirect_to restaurants_path
		end
	end




end
