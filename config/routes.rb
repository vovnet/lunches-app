Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/registrations' }
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'dashboard#index' 
  get '/days/:id', to: 'days#show'
end
