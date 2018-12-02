Rails.application.routes.draw do

  	devise_for :users
	root 'main#index' #redirecciona a la pagina principal
    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions, :users, :searches, :hotsales, :reservations #para poder acceder a las residencias, subastas, usuarios y busquedas
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
    delete '/admins/:id/destroy', to:'users#destroyAdmin', as: 'admin_destroy'

    #USERS
    get '/clients/:id/delete', to:'users#deleteClient', as: 'client_delete'
    get '/clients/deleted', to:'users#deletedClient', as: 'client_deleted'
    get '/clients/:id/destroy', to:'users#destroyClient'
    delete '/clients/:id/destroy', to:'users#destroyClient', as: 'client_destroy'

    #
    get '/enterBid', to:'auctions#enterBid'
    get '/contact', to:'contacto#contact'
    post '/contact_success', to:'contacto#contact_success'
end
