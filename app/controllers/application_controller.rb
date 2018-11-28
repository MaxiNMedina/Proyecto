class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:userName, :password, :credits, :isAdmin, :isPremium ])
  end

	######## PARA PONER ERRORES DE DEVISE EN header
	### https://pupeno.com/2016/04/26/show-a-devise-log-in-or-sign-up-forms-in-another-page/

	def new
  end

  def resource_name
    :user
  end
  helper_method :resource_name

  def resource
    @resource ||= User.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping

  def resource_class
    User
  end
  helper_method :resource_class

end
