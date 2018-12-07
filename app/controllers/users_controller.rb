class UsersController < ApplicationController
  #@user = User.find params[:user_id]
  #@auction = @user.auctions.find params[:id]
  #@auction << current_user
  protect_from_forgery #para que ande createAdmin

  def index
    @user = User.all
  end

  def indexAdmins
    @admin = User.admins
  end

  def new
  	@user = User.new
  end

  def newAdmin
    @admin = User.new
  end

  def create
    @user = User.new( params.require(:user).permit(:userName, :email, :password, :isAdmin, :isPremium, :credits, :name, :surname, :birthday, :credit_card_number, :cvv, :card_expiry_date) )
    if @user.save
        redirect_to users_path, notice: "Se añadio un usuario exitosamente."
    else
      render :new
    end
  end

  def createAdmin
    @admin = User.new( params.require(:user).permit(:userName, :email, :password, :credits, :isAdmin) )
    if @admin.save
      redirect_to admins_path, notice: "Se añadio un admin exitosamente."
    else
      @error = "Contrasena muy debil"
      render :newAdmin
    end
  end

  def show
  	@user = User.find(params[:id])
    @auctions = @user.auctions
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to root_path
  end

  def deleteClient
    @client = User.find(params[:id])
  end
  def deletedClient
    @deletedWasPremium = :deletedWasPremium
  end

  def destroyClient
    @client = User.find(params[:id])
    @deletedWasPremium = @client.isPremium
    @client = User.destroy(params[:id])
    redirect_to client_deleted_path
  end

  def destroyAdmin
    @admin = User.destroy(params[:id])
    redirect_to admins_path
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if !@user.isAdmin?
      @user.update(user_params)
    else
      @user.update(admin_params)
    end
    redirect_to user_path
  end
  #Usado para mandar parametros del usuario. Lo uso en la modificacion del usuario para actualizar los datos.
  #Se puede usar para otros metdos, como por ej. create.
  def user_params
    params.require(:user).permit(:userName, :email, :password, :isAdmin, :isPremium, :credits, :name, :surname, :birthday, :credit_card_number, :cvv, :card_expiry_date)
  end
  def admin_params
    params.require(:user).permit(:userName, :email, :password, :isAdmin, :credits)
  end

  def be_premium
    @user = User.find(params[:id])
  end

  def apply_premium
    @user = User.find(params[:id])
    @user.isPremium = "solicitado"
    @user.save
    redirect_to current_user, notice: 'Su solicitud ha sido enviada con exito.'
  end

  def enable_premium
    @user = User.find(params[:id])
    @user.isPremium = "si"
    @user.save
    redirect_to users_path
  end

  def disable_premium
    @user = User.find(params[:id])
    @user.isPremium = "no"
    @user.save
    redirect_to users_path
  end

end
