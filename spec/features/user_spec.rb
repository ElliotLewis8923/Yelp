require 'rails_helper'

	include Warden::Test::Helpers

Warden.test_mode!

describe 'User' do 
	before(:each) do
			@user = create(:user)
			create(:restaurant)
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


		
	
end