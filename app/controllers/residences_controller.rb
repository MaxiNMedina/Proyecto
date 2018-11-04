class ResidencesController < ApplicationController
  def index
  end
  
  def new
  	@residence = Residence.new #creo una nueva residencia
  end
  
  def create  
  end 

  def show
  	@residence = Residence.find(params[:id]) #Asigna la residencia a la variable residencia
  	
  	
  end

  def edit
    @residence = Residence.find(params[:id]) 
  end
  
  def destroy
  	 @residence=Residence.destroy(params[:nombre])  #elimino un monstruo 
	 redirect_to residences_path   #redirecciono a la pagina de monstruos
  end

  def update
    @residence = Residence.find(params[:id]) 
    @residence.update(residence_params)
    redirect_to residences_path
  end
  #Usado para mandar parametros de la residencia. Lo uso en la modificacion de residencia para actualizar los datos.
  #Se puede usar para otros metdos, como por ej. create.
  def residence_params
    params.require(:residence).permit(:nombre)
  end
end
