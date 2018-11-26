Rails.application.routes.draw do

  	devise_for :users
	root 'main#index' #redirecciona a la pagina principal

    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions, :users #para poder acceder a las residencias y subastas
    resources :users do
  		member do
    		get 'be_premium'
            get 'apply_premium'
            get 'enable_premium'
            get 'disable_premium'
 		end
	end
    #ADMINISTRADORES
    get '/admins', to:'users#indexAdmins'
    get '/admins/new', to:'users#newAdmin'
    post '/admins', to:'users#createAdmin'
    get '/admins/:id/destroy', to:'users#destroyAdmin'
    delete '/admins/:id/destroy', to:'users#destroyAdmin', as: 'destroyAdmin'

    #
    get '/enterBid', to:'auctions#enterBid'
    get '/contact', to:'contacto#contact'
    post '/contact_success', to:'contacto#contact_success'
end
