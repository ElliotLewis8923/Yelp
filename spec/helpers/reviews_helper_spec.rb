require 'rails_helper'

describe ReviewsHelper, :type => :rails_helper do

	include ReviewsHelper

	 context '#star rating' do


		it 'does nothing when given anything but a number' do
			expect(star_rating('blah')).to eq "blah"
		end

		it 'returns 5 black stars for 5' do
			expect(star_rating(5)).to eq '★★★★★'
		end

		it 'returns 3 black stars and 2 white stars for 3' do
			expect(star_rating(3)).to eq '★★★☆☆'
		end

	end

end