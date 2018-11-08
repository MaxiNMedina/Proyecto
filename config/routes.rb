Rails.application.routes.draw do

	root 'main#index' #redirecciona a la pagina principal
    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions, :users #para poder acceder a las residencias y subastas
end
