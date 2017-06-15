Rails.application.routes.draw do

 
  root 'home#index'
  post 'search' => 'main#search'
  get 'show/:id' => 'main#show'
  # get 'show/:id' => 'main#show'
  
  resources :actions
  resources :matters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
