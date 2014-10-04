FactoryGirl.define do
    
  	factory :user do
    	email 'elliot@myownspecialdomain.com'
    	password 'f4k3p455w0rd'
  	end


	factory :review do
		rating 4
		thoughts 'alright'
		user
		restaurant
	end

	factory :endorsement do
		user
		review
	end

end