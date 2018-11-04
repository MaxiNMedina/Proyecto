<<<<<<< HEAD
class Residence < ApplicationRecord
    default_scope -> { order :name }
=======
class Residence < ApplicationRecord	
	default_scope -> { order :nombre }
	has_many :auctions
>>>>>>> master
end
