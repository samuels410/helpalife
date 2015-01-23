Community::Application.routes.draw do
  get "post/index"
  get "post/new"
  get "post/create"
  get "post/edit"
  get "post/update"
  get "post/show"
  get "post/destroy"
  resources :notifications

  namespace :blog do
    resources :posts
  end

  resources :referrals

  resources :needs ,:path =>  :requirements

  root to: 'home#index'
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :home
  resources :omniauth_links
  match '/auth/:provider/callback' ,to: 'authentication#create', via: [:get, :post]
  match '/auth/failure' ,to:'authentication#auth_failure' ,via: [:get, :post]
  match 'donors' ,to:'home#donors', via: [:get, :post]
  match 'about' ,to:'home#about', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'vision' ,to:'home#vision', via: [:get]
  resources :contacts
end
