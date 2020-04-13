Rails.application.routes.draw do
  
  root "sessions#home"

  get '/signup', to: 'employees#new'
  get '/signup', to: 'employees#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  #get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/auth/google_oauth2/callback' => 'sessions#google'
  resources :logs

  resources :contacts do
    resources :logs, only: [:new, :create, :index]
  end 


  resources :employees do
    resources :logs, only: [:index]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
