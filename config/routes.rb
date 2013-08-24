TravelSage::Application.routes.draw do
 root :to => 'main#index'
 resources :continents, only: [:show]
end
