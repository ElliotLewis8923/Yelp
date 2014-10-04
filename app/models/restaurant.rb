class Restaurant < ActiveRecord::Base

	has_many :reviews, dependent: :destroy
	belongs_to :user
	validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
