class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:enterBid]
	def index
    	@reservation = Reservation.all
 	end

 	def show
    	@reservation = Reservation.find(params[:id])
  	end

  	def new
      @res = Residence.find(params[:id])
      @disp = Availability.find(params[:aid])
    	@reservation = Reservation.new
  	end

  	def create    #Crea una nueva reserva y la guarda en la base de datos
      
      @reservation = Reservation.new(params.require(:reservation).permit(:residence_id, :user_id, :year, :week))
      @reservation.user = current_user
      if @reservation.save
        redirect_to root_path, notice: "Gracias por su compra! En las proximas 24hs recibira un e-mail con los datos de su reserva y su factura de compra"
      else
        render :new
      end
  	end


end
