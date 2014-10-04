require 'rails_helper'

	include Warden::Test::Helpers

Warden.test_mode!

describe 'reviewing' do
    before do

        @restaurant = Restaurant.create(name: 'KFC', description: 'meh')
        visit '/restaurants'
        login_as create(:user)
    end

    it 'allows users to leave a review using a form' do
       visit '/restaurants'
       click_link 'Review KFC'
       write_review('3', 'so so')
       expect(current_path).to eq '/restaurants'
       expect(page).to have_content('so so')
    end

    it 'should display a star rating for each review on the show page' do
      click_link 'Review KFC'
      write_review('3', 'so so')
      click_link 'KFC'
      expect(page).to have_content '★★★☆☆'
    end

    it 'should display in words the time elapsed since the review was posted' do
			time = Time.now - 3000
			@restaurant.reviews.create(thoughts:'ewww', rating:1, created_at:time)
			click_link 'KFC'
			expect(page).to have_content '50 minutes ago'
		end



end