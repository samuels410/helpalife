Community::Application.routes.draw do
  resources :organizations do
    collection do
      get :display 
      post :join
      post :remove
    end
  end

  resources :notifications

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




=begin 
Unique organization name,
organizations profile picture,
complete address,
a 255 char description.
=end  