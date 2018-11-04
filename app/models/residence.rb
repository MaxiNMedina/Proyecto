class Residence < ApplicationRecord	
	default_scope -> { order :nombre }
	has_many :auctions
end
