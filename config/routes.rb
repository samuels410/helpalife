Community::Application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :home
  resources :omniauth_links
  match '/auth/:provider/callback' ,to: 'authentication#create', via: [:get, :post]
  match '/auth/failure' ,to:'authentication#auth_failure' ,via: [:get, :post]
end
