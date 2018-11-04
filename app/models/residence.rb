class Residence < ApplicationRecord	
	default_scope -> { order :name }
	has_many :auctions
end
