require 'rails_helper'

	include Warden::Test::Helpers

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
	      @user = create(:luke)
	      @restaurant.user_id = @user.id
	      @restaurant.save
	      login_as @user
	  end

	  it 'should display restaurants on the homepage' do
	    expect(page).to have_content('KFC')
	    expect(page).not_to have_content('No restaurants yet')
	  end

	  it 'can view an individual restaurant in greater detail' do
	  	click_link 'KFC'
	  	expect(page).to have_content 'KFC'
	  	expect(page).to have_content 'meh'
	  end

	  it 'can be edited' do
	  	click_link 'KFC'
	  	click_link 'Edit'
	  	fill_in 'Name', :with => 'Maccy D'
	  	fill_in 'Description', :with => 'urgh'
	  	click_button 'Submit'
	  	expect(page).to have_content 'Maccy D'
	  end

	  it 'can be deleted' do
	  	click_link 'KFC'
	  	click_link 'Delete'
	  	expect(current_path).to eq '/restaurants'
	  	expect(page).not_to have_content 'KFC'
	  end

	end

	context 'user adds a restaurant' do

		it 'add a restaurant' do
			login_as create(:luke)
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', :with => 'KFC'
			fill_in 'Description', :with => 'meh'
			click_button 'Submit'
			expect(current_path).to eq '/restaurants'
      expect(page).to have_content('KFC')
		end
	end

end