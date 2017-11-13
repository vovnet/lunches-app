Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'welcome#index'
  
  get '/dashboard', to: 'dashboard#index' 
  get '/orders/:id', to: 'orders#new'
  post '/orders/create'
  get 'welcome/index'

  namespace :admin do 
    get '/dashboard', to: 'dashboard#index'
    get '/users', to: 'users#index'
    get '/items', to: 'items#index'
    get '/item/new', to: 'items#new'
    get '/orders/:id', to: 'orders#show'
    post '/item/create', to: 'items#create'
  end

  namespace :api do 
    namespace :v1 do 
      resources :orders
    end
  end
end
