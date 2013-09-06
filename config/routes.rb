TravelSage::Application.routes.draw do
 root :to => 'main#index'
 resources :articles
 resources :users
 resources :cities
 resources :tags
 resources :categories
 match '/filter', to: 'main#filter', via: [:post]
 match '/citysage', to: 'citysage#show', via: :get
 match '/about', to: 'about#show', via: :get
 match '/meetsages', to: 'meet#show', via: :get
end
