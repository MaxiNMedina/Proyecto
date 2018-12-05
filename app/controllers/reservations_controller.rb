class ReservationsController < ApplicationController

	def index
    	@reservation = Reservation.all
 	end

 	def show
    	@reservation = Reservation.find(params[:id])
  	end

  	def new
      @res = Residence.find(params[:id])
      @disp = Availability.find(params[:aid])
      @disp.is_available = false
      @disp.save
    	@reservation = Reservation.new
  	end

  	def create    #Crea una nueva reserva y la guarda en la base de datos
      
      @reservation = Reservation.new(params.require(:reservation).permit(:residence_id, :user_id, :year, :week, :price))
      @reservation.user = current_user
      if @reservation.save
        redirect_to root_path, notice: "Gracias por su compra! En las proximas 24hs recibira un e-mail con los datos de su reserva y su factura de compra"
      else
        render :new
      end
  	end

    def destroy #Cancela la reserva
      @reservation = Reservation.find(params[:id])
      #Marco la residencia como disponible para esa semana
      Availability.where(:residence_id => @reservation.residence_id, :week =>@reservation.week, :year => @reservation.year).update_all(:is_available => true)
      @reservation = Reservation.destroy(params[:id])
      redirect_to current_user
    end

    def show
      @reservation = Reservation.find(params[:id])
    end

end
