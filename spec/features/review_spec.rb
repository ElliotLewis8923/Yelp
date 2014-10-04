require 'rails_helper'

describe 'reviewing' do
    before do
        Restaurant.create(name: 'KFC', description: 'meh')
        visit '/restaurants'
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



end