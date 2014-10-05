FactoryGirl.define do
    
  factory :user do

  	factory :luke do
    	email 'luke@domain.com'
    	password 'f4k3p455w0rd'
  	end

  	factory :anna do
  		email 'anna@blah.com'
    	password 'f4k3p455w0rd'
    end
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

	factory :restaurant do
		name 'kfc'
		description 'food'
		image nil
	end

end