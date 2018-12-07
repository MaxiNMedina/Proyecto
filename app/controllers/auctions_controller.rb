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
      #Creo una reserva con los datos de la subasta finalizada
      #Actualizo la tabla de disponibilidad de la residencia que ya fue reservada
      Availability.where(:id => @auction.availability.id ).update_all(:is_available => false)
      #Termina la actualizacion y elimina la subasta del sistema
      if !@auction.user.isAdmin?
        @reservation = Reservation.new(residence: @auction.residence, user: @auction.user, year: @auction.availability.year, week: @auction.availability.week, price: @auction.maxbid)
        @reservation.save
      else
        @hotsale = Hotsale.new(residence: @auction.residence, availability: @auction.availability, price: @auction.maxbid / 2)
        @hotsale.save
      end
      @auction = Auction.destroy(params[:id])
      redirect_to auctions_path
    end

  def new
    #Parametros necesarios para el alta de subasta.
    @res = Residence.find(params[:id])
    @disp = Availability.find(params[:aid])
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid, :dateStart, :user_id, :availability_id))
    @auction.user = current_user
    @auction.dateEnd =  @auction.dateStart + 3
    if (@auction.dateStart <= Date.today || @auction.dateStart > Date.commercial(@auction.availability.year, @auction.availability.week) || @auction.dateEnd > Date.commercial(@auction.availability.year, @auction.availability.week))
        redirect_to auctions_path, notice:"La fecha de inicio de la subasta debe ser despues de la fecha actual y antes de la semana de reserva."
    else
      if @auction.save
        redirect_to auctions_path, notice: "Se creo la subasta exitosamente."
      else
        render :new
      end
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
