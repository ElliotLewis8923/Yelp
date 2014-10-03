require 'rails_helper'

describe 'Review' do 

	context 'validations' do

		it 'must be given a rating between one and five' do
			Review.create(rating: 776848754, thoughts: 'tantalising')
			Review.create(rating: 0, thoughts: "didn't wake up for two months")
			expect(Review.count).to eq 0
			Review.create(rating: Math::PI, thoughts: 'the quiche is magnificent')
			expect(Review.count).to eq 1
		end
	end
end