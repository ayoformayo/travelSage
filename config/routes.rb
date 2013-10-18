TravelSage::Application.routes.draw do
  match 'auth/facebook/callback', to: 'sessions#create_with_facebook', via: :get
  match 'auth/twitter/callback', to: 'sessions#create_with_twitter', via: :get
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'sessions#destroy', as: 'signout', via: :get

  root :to => 'main#index'
  resources :articles
  resources :comments
  resources :users
  resources :cities
  resources :tags
  resources :categories
  match '/filter', to: 'main#filter', via: [:post]
  match '/citysage', to: 'citysage#show', via: :get
  match '/about', to: 'about#show', via: :get
  match '/meetsages', to: 'meet#show', via: :get
end
