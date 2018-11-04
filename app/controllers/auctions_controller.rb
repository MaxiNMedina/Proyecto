class AuctionsController < ApplicationController

  def index
    @auction = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def create
  end

  def destroy
    @auction = Auction.destroy(params[:id])
    redirect_to auctions_path
  end

  def update
  end

end
