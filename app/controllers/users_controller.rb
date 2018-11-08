class UsersController < ApplicationController
  #@user = User.find params[:user_id]
  #@auction = @user.auctions.find params[:id]
  #@auction << current_user

  def index
    @user = User.all
  end

  def new
  	@user = User.new(credits: 2)
  end

  def create
    @user = User.new( params.require(:user).permit(:email, :password) )
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

end
