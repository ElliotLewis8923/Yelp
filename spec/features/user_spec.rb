require 'rails_helper'

	include Warden::Test::Helpers

Warden.test_mode!

describe 'User' do 
	before(:each) do
			@user = create(:luke)
			@user2 = create(:anna)
			@restaurant = create(:restaurant)
		end

	it 'can not write multiple reviews for the same restaurant' do
		login_as @user
		visit '/restaurants'
		click_link 'Review kfc'
		write_review('bad', 2)
		expect(Review.count).to eq 1
		click_link 'Review kfc'
		expect(page).to have_content "Sorry, you have already reviewed this restaurant."
	end

	it 'can only edit a restaurant they have created' do
		@restaurant.user_id = @user2.id
		@restaurant.save
		login_as @user
		visit '/restaurants'
		click_link 'kfc'
		expect(page).not_to have_content 'Edit'
		logout
		login_as @user2
		visit '/restaurants'
		click_link 'kfc'
		click_link 'Edit'
		edit_restaurant('Maccy Ds', 'bad')
		expect(page).to have_content 'Maccy Ds'
	end





		
	
end