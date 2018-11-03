class Residence < ApplicationRecord
	
	default_scope -> { order :nombre }
end
