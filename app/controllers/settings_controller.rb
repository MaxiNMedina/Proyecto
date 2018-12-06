class SettingsController < ApplicationController
	def index
		@setting = Setting.all
	end

	def show
		@setting = Setting.find(params[:id])
	end

	def edit
    @setting = Setting.find(params[:id])
  	end

  	def update
    @setting = Setting.find(params[:id])
    @setting.update(setting_params)
    redirect_to root_path, notice: "Se actualizaron las cuotas con exito"
	end

  	def setting_params
    	params.require(:setting).permit(:user_fee, :premium_user_fee)
  	end
end
