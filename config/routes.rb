Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post :incoming, to: 'incoming#create'
  
  resources :users
  resources :sessions
  root "welcome#index"

end
