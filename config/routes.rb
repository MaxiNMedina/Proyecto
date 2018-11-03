Rails.application.routes.draw do

  	get 'residences/index'
    root 'main#index' #redirecciona a la pagina principal
    get '/faq', to:'preguntasfrecuentes#faq' #ruta para poder acceder a las faq

    resources :residences #para poder acceder a las residencias
end
