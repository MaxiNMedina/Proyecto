class UsersController < ApplicationController
  #@user = User.find params[:user_id]
  #@auction = @user.auctions.find params[:id]
  #@auction << current_user

  def index
    @user = User.all
  end

  def new 
  	@user = User.new
  end

  def create
    @user = User.new( params.require(:user).permit(:userName, :email, :password, :cretits) )
    if @user.save
      redirect_to users_path, notice: "Se añadio un usuario exitosamente."
    else
      render :new
    end
  end

  def show
  	@user = User.find(params[:id])
    @auctions = @user.auctions
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to users_path
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end
  #Usado para mandar parametros del usuario. Lo uso en la modificacion del usuario para actualizar los datos.
  #Se puede usar para otros metdos, como por ej. create.
  def user_params
    params.require(:user).permit(:userName, :email, :password, :credits)
  end

  def be_premium
    @user = User.find(params[:id])
  end
end
