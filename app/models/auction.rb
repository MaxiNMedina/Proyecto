class Auction < ApplicationRecord
	belongs_to :residence
	has_and_belongs_to_many :users
	belongs_to :user
	belongs_to :availability
end
