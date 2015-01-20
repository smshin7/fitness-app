Rails.application.routes.draw do

  root to: "pages#homepage" 
  get '/signup' => 'users#new', as: :signup
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :users do
  	resources :workouts do 
  		resources :cardios
  		resources :strengths
  	end
  end

end
