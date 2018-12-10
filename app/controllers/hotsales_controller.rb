class HotsalesController < ApplicationController
  before_action :set_hotsale, only: [:show, :edit, :update, :destroy]

  # GET /hotsales
  # GET /hotsales.json
  def index
    @hotsales = Hotsale.all
  end

  # GET /hotsales/1
  # GET /hotsales/1.json
  def show
  end

  # GET /hotsales/new
  def new
    @hotsale = Hotsale.new
  end

  # GET /hotsales/1/edit
  def edit
  end

  # POST /hotsales
  # POST /hotsales.json
  def create
    @hotsale = Hotsale.new(hotsale_params)

    respond_to do |format|
      if @hotsale.save
        format.html { redirect_to @hotsale, notice: 'Hotsale was successfully created.' }
        format.json { render :show, status: :created, location: @hotsale }
      else
        format.html { render :new }
        format.json { render json: @hotsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotsales/1
  # PATCH/PUT /hotsales/1.json
  def update
      if @hotsale.update(params[:hotsale].permit(:price))
        flash[:notice] = "¡Hotsale Editada!"
        redirect_to @hotsale
      else
        flash[:notice] = "¡Error! Este Hotsale no se edito"
        redirect_to @hotsale
      end
  end

  # DELETE /hotsales/1
  # DELETE /hotsales/1.json
  def destroy
    if current_user.present? && !current_user.isAdmin? #Si lo compro un usuario
      #Se procede a crear una reserva con los datos de la hotsale, actualiza la tabla de disponibilidad.
      @reservation = Reservation.new(residence: @hotsale.residence, user: current_user, year: @hotsale.availability.year, week: @hotsale.availability.week, price: @hotsale.price)
      Availability.where(:id => @hotsale.availability.id ).update_all(:is_available => false)
      @reservation.save
      current_user.update(credits: current_user.credits - 1)
      flash[:notice] = "Se ha hecho la reserva de la residencia"
    else
      flash[:notice] = "¡Hotsale Terminada!"
    end
    @hotsale.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotsale
      @hotsale = Hotsale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotsale_params
      params.fetch(:hotsale, {})
    end
end
