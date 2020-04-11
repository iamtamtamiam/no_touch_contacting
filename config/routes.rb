Rails.application.routes.draw do
  
  root "sessions#home"

  get '/signup', to: 'employees#new'
  get '/signup', to: 'employees#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  
  resources :logs

  resources :contacts


  resources :employees

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
