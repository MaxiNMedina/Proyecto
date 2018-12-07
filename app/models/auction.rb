class Auction < ApplicationRecord
	belongs_to :residence
	has_and_belongs_to_many :users
	belongs_to :user
	belongs_to :availability

 	#FUNCTION SQL PARA ENCONTRAR UNA FECHA ENTRE DOS FECHAS
	#scope :open, -> { where("? BETWEEN dateStart AND dateEnd", Date.today)}
	#scope :closed, -> { where("? NOT BETWEEN dateStart AND dateEnd", Date.today)}

	#FUNCTION POSTGRESQL PARA ENCONTRAR UNA FECHA ENTRE DOS FECHAS
 	scope :open, -> {where(':date BETWEEN Auctions."dateStart" AND Auctions."dateEnd"', date: Date.today)}
 	scope :closed, -> {where(':date NOT BETWEEN Auctions."dateStart" AND Auctions."dateEnd"', date: Date.today)}
	scope :pending, -> {where(':date < Auctions."dateStart"', date: Date.today)}
 	scope :finished, -> {where(':date > Auctions."dateEnd"', date: Date.today)}

	def isActive()
		if Date.today > self.dateStart && Date.today < self.dateEnd
			return true
		else
			return false
		end
	end

end
