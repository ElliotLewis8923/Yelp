require 'rails_helper'

	include Warden::Test::Helpers

describe 'endorsing reviews' do
	before(:each) do
		kfc = Restaurant.create(name: 'KFC', description:'food')
		kfc.reviews.create(rating:3, thoughts:"OK")
		login_as create(:anna)
	end


	it 'can endorse a review, updating the review endorsement count', js: true do
		visit '/restaurants'
		click_link 'Endorse'
		expect(page).to have_content '1 endorsement'
	end
end