require 'rails_helper'

describe 'Restaurant' do 

	context 'validations' do

		it 'can not be created with a name shorter than three characters' do
			Restaurant.create(name: 'hi', description: 'weeeeeeeeeeee')
			expect(Restaurant.count).to eq 0
		end
	end

end