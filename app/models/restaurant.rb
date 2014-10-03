class Restaurant < ActiveRecord::Base

	has_many :reviews, dependent: :destroy
	validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
