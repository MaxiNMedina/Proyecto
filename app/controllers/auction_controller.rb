class AuctionController < ApplicationController

	def show
		@auction = Auction.find(params[:id]) #Asigna la subasta id a la variable subasta
	end

	def create

	end

	def destroy            #elimina una residencia de la base de datos
    	@auction = Auction.destroy(params[:id])
    	redirect_to auction_path
  	end

	def new
		@auction = Auction.new #Creo una nueva subasta
	end
end
