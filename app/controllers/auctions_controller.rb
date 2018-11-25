class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:enterBid]
  def index
    @auction = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def destroy
      @auction = Auction.find(params[:id])
      @reservation = Reservation.new(residence: @auction.residence, user: @auction.user, year: "2018", week: "1")
      @reservation.save
      @auction = Auction.destroy(params[:id])
      redirect_to auctions_path
    end

  def new
    @res = Residence.find(params[:id])
    @disp = Availability.find(params[:aid])
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid, :dateStart, :user_id, :availability_id))
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

  def selectWeek
    @auction = Auction.find(params[:id])
  end

  def setWeek
    @auction = Auction.find(params[:id])
    @auction.update(params.permit(:residence_id, :maxbid, :dateStart, :user_id, :availability_id))
  end

  def self.weeks_for_select
    av=Availability.where(residence_id: params[:id])
    [Date.commercial(av.year,av.week)]
  end

end
