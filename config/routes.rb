Rails.application.routes.draw do

  get 'auctions/index'
  get 'auctions/show'
  get 'auctions/new'
  get 'auctions/create'
  get 'auctions/destroy'
  get 'auctions/update'
	root 'main#index' #redirecciona a la pagina principal
  	get 'residences/index'
		get 'auctions/index'
    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions #para poder acceder a las residencias y subastas
end
