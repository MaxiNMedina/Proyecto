class ResidencesController < ApplicationController
  def index
    @residence = Residence.all
  end

  def new
  	@residence = Residence.new #creo una nueva residencia
  end

  def create    #Crea una nueva residencia y la guarda en la base de datos
    @residence = Residence.new( params.require(:residence).permit(:name, :desc, :dir, :available) )
    if @residence.save
      redirect_to residences_path, notice: "Se añadio la reserva exitosamente."   #redirecciono a la pagina de residencias
    else
      render :new
    end

  end

  def show
  	@residence = Residence.find(params[:id]) #Asigna la residencia a la variable residencia
    @auctions = @residence.auctions
  end

  def edit
    @residence = Residence.find(params[:id])
  end

  def destroy            #elimina una residencia de la base de datos
    @residence = Residence.destroy(params[:id])
    redirect_to residences_path
  end

  def update
    @residence = Residence.find(params[:id])
    @residence.update(residence_params)
    redirect_to residences_path
  end
  #Usado para mandar parametros de la residencia. Lo uso en la modificacion de residencia para actualizar los datos.
  #Se puede usar para otros metdos, como por ej. create.
  def residence_params
    params.require(:residence).permit(:name, :desc, :dir, :available)
  end
end
