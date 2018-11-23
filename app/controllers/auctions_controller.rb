class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:enterBid]
  def index
    @auction = Auction.all
  end

  def show
    @auction = Auction.find(params[:id]) #Asigna la subasta id a la variable subasta
    @user = User.new
  end

  def destroy            #elimina una residencia de la base de datos
      @auction = Auction.destroy(params[:id])
      redirect_to auctions_path
    end

  def new
    @auction = Auction.new #Creo una nueva subasta
  end

  def create
    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid, :dateStart))
    @auction.dateEnd =  @auction.dateStart + 3
    if @auction.save
      redirect_to auctions_path, notice: "Se creo la subasta exitosamente."  #redirecciono a la pagina de subastas
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
