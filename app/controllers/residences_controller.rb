class ResidencesController < ApplicationController
  def index
  end
  
  def new
  	@residence = Residence.new #creo una nueva residencia
  end
  
  def create  
  end 

  def show
  	@residence = Residence.find(params[:nombre]) #Asigna el monstruo con id a la vairable @monstruo
  	
  end

  def edit    
  end
  
  def destroy
  	 @residence=Residence.destroy(params[:nombre])  #elimino un monstruo 
	 redirect_to resicences_path   #redirecciono a la pagina de monstruos
  end
end
