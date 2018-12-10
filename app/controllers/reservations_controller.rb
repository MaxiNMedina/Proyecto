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

      if Date.today < Date.commercial(@reservation.year, @reservation.week) #Le devuelvo un credito si la reserva se cancela antes de la semana reservada
        user = @reservation.user
        user.update(credits: current_user.credits + 1)
      end
      @reservation = Reservation.destroy(params[:id])
      redirect_to current_user
    end

    def show
      @reservation = Reservation.find(params[:id])
    end

    def pay_reservation
      @reservation = Reservation.find(params[:id])
    end

    def pay
      @reservation = Reservation.find(params[:id])
      user = @reservation.user
      #Esto es necesario asi puedo comparar correctamente las fechas de vencimiento de la tarjeta
      fecha = params[:fecha]
      date = Date.new fecha["date(1i)"].to_i, fecha["date(2i)"].to_i, fecha["date(3i)"].to_i
      if current_user.id == user.id && user.credit_card_number == params[:number].to_i && user.card_expiry_date.month == date.month && user.card_expiry_date.year == date.year && user.cvv == params[:code].to_i
        @reservation.update(price: 0)
        redirect_to root_path, notice: "Se ha confirmado su pago, se descontara de su tarjeta."
      else
        redirect_to pay_reservation_url, notice: "Hubo un error. Verifique los datos e intente nuevamente."
      end
    end

end
