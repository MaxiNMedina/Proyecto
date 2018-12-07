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
    	@reservation = Reservation.new
  	end

  	def create    #Crea una nueva reserva y la guarda en la base de datos
      @disp = Availability.find(params[:availability_id])
      @reservation = Reservation.new(params.require(:reservation).permit(:residence_id, :user_id, :year, :week, :price))
      @reservation.user = current_user
      #Marco que la residencia reservada no esta disponible para el año y semana de la reserva
      if @reservation.save
        @disp.update(is_available: false)
        current_user.update(credits: current_user.credits - 1)
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
