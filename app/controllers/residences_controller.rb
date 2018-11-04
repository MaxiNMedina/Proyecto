class ResidencesController < ApplicationController
  def index
    @residence = Residence.all
  end

  def new
  	@residence = Residence.new #creo una nueva residencia
  end

  def create    #Crea una nueva residencia y la guarda en la base de datos
    @residenceNew = Residence.create( params.require(:name).permit(:desc, :dir, :available) )

    if(@residenceNew.save)
      redirect_to residences_path   #redirecciono a la pagina de residencias
    else
      render 'new'
    end

  end

  def show
  	@residence = Residence.find(params[:id]) #Asigna la residencia a la variable residencia
  end

  def edit
  end

  def destroy            #elimina una residencia de la base de datos
    @residenceDestroy = residence.find(params[:id]).destroy
    flash[:notice] = "Borrado!"
  end
end
