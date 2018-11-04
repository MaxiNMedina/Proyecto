class AuctionController < ApplicationController

  def create

  end

  def new
  	@auction = Auction.new #Creo una nueva subasta
  end
end
