Community::Application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :home
  resources :omniauth_links
  match '/auth/:provider/callback' ,to: 'authentication#create', via: [:get, :post]
  match '/auth/failure' ,to:'authentication#auth_failure' ,via: [:get, :post]
  match 'donors' ,to:'home#donors', via: [:get, :post]
end
