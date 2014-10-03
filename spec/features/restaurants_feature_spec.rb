require 'rails_helper'

describe 'restaurants' do
  
  context 'no restaurants have been added' do
    
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
	  
	  before do
	      @restaurant = Restaurant.create(name: 'KFC', description: 'meh')
	      visit '/restaurants'
	  end

	  it 'should display restaurants on the homepage' do
	    puts @restaurant.inspect
	    expect(page).to have_content('KFC')
	    expect(page).not_to have_content('No restaurants yet')
	  end

	  it 'can view an individual restaurant in greater detail' do
	  	click_link 'KFC'
	  	expect(page).to have_content 'KFC'
	  	expect(page).to have_content 'meh'
	  end

	end

	context 'user adds a restaurant' do

		it 'add a restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', :with => 'KFC'
			fill_in 'Description', :with => 'meh'
			click_button 'Add restaurant'
			expect(current_path).to eq '/restaurants'
      expect(page).to have_content('KFC')
		end
	end

end