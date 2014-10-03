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
	  end

	  it 'should display restaurants' do
	    visit '/restaurants'
	    puts @restaurant.inspect
	    expect(page).to have_content('KFC')
	    expect(page).not_to have_content('No restaurants yet')
	  end
	end

	context 'user adds a restaurant' do

		it 'add a restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', :with => 'KFC'
			fill_in 'Description', :with => 'meh'
			click_button 'Add restaurant'
		end
	end

end