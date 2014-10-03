require 'rails_helper'

describe 'Restaurant' do 

	context 'validations' do

		it 'can not be created with a name shorter than three characters' do
			Restaurant.create(name: 'hi', description: 'weeeeeeeeeeee')
			expect(Restaurant.count).to eq 0
		end

		it 'must have a unique name' do
			Restaurant.create(name: 'Chicken Cottage', description: 'reconstituted pigeon meat')
			Restaurant.create(name: 'Chicken Cottage', description: 'yep you heard')
			expect(Restaurant.count).to eq 1
		end
	end

end