class Auction < ApplicationRecord
	belongs_to :residence
	#many to many relation with users
	belongs_to :owner, class_name: "User", foreign_key: :user_id
	has_and_belongs_to_many :users
end
