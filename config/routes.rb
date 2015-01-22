Rails.application.routes.draw do


  get 'bookmarks/index'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post :incoming, to: 'incoming#create'
  
  resources :topics
  resources :users
  resources :sessions
  root "welcome#index"

end
