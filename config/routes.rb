Rails.application.routes.draw do
  
  get '/signup', to: 'employees#new'
  get '/signup', to: 'employees#create'
  
  
  resources :logs
  resources :contacts
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
