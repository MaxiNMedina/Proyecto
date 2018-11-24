class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:enterBid]
  def index
    @auction = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
    @user = User.new
  end

  def destroy
      @auction = Auction.find(params[:id])
      @reservation = Reservation.new(residence: @auction.residence, user: @auction.user, year: "2018", week: "1")
      @reservation.save
      @auction = Auction.destroy(params[:id])
      redirect_to auctions_path
    end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid, :dateStart, :user_id))
    @auction.user = current_user
    @auction.dateEnd =  @auction.dateStart + 3
    if @auction.save
      redirect_to auctions_path, notice: "Se creo la subasta exitosamente."
    else
      render :new
    end
  end

  def update
    @auction = Auction.find(params[:id])
    #@auction.user.email = params[:user][:email]
    if @auction.maxbid.nil?
      @auction.maxbid = params[:addtobid].to_f
    else
      @auction.maxbid += params[:addtobid].to_f
    end
    @auction.user = current_user
    @auction.save
  end

  def enterBid
    @user = User.new(credits: 2)
    if @user.credits >= 0
      @auction = Auction.find(params[:id])
      @addtobid = 0;
    else
      redirect_to auctions_path
    end
  end

end
