Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'dashboard#index'
  
  get '/dashboard', to: 'dashboard#index' 
  get '/orders/:id', to: 'orders#new'
  post 'orders/create'

  namespace :admin do 
    get '/users', to: 'users#index'
  end
end
