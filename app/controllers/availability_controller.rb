class AvailabilityController < ApplicationController
	def new
		@availability = Availability.new 
	end
	def create
		@availability = Availability.new(params.require(:availability).permit(:residence_id, :year, :week))
		@availability.is_available = true
		@availability.save 
	end
	def self.init(rid)
		y=Date.today.cwyear
		for j in 1..2
			for i in 1..52
				@availability = Availability.new
				@availability.residence_id= rid
				@availability.year = y
				@availability.week = i
				@availability.is_available = true
				@availability.save
			end
			y= y+1
		end
	end
end
