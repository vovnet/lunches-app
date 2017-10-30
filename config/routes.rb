Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'dashboard#index'
  
  get '/dashboard', to: 'dashboard#index' 
  get '/orders/:id', to: 'orders#new'
  post 'orders/create'

  namespace :admin do 
    get '/users', to: 'users#index'
    get '/items', to: 'items#index'
    get '/item/new', to: 'items#new'
    post '/item/create', to: 'items#create'
  end
end
