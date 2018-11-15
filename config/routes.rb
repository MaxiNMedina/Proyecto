Rails.application.routes.draw do

  	devise_for :users
	root 'main#index' #redirecciona a la pagina principal

    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions, :users #para poder acceder a las residencias y subastas
    get '/enterBid', to:'auctions#enterBid'
    get '/contact', to:'contacto#contact'
    get '/contact_success', to:'contacto#contact_success'

end
