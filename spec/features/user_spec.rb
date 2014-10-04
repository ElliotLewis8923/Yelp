require 'rails_helper'

	include Warden::Test::Helpers
  include Devise::TestHelpers

Warden.test_mode!

describe 'User' do 
	before(:each) do
			@user = create(:user)
		end

	it 'can not add a review unless signed in' do
	end


		
	
end