Rails.application.routes.draw do

<<<<<<< HEAD
=======
  get 'auction/create'
  get 'auction/new'
  	get 'residences/index'
>>>>>>> master
    root 'main#index' #redirecciona a la pagina principal
  	get 'residences/index'
    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences, :auctions #para poder acceder a las residencias
end
