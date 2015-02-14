Community::Application.routes.draw do
  resources :subscribers

  match 'icc-world-cup-live-update' ,to:'subscribers#index', via: [:get] ,as: :live_update

  resources :notifications

  namespace :blog do
    resources :posts
    post "posts/post_notify/:id" => "posts#post_notify", as: :post_notify
    post "post/:id/publish" => "posts#publish", as: :publish
    post "post/:id/undo_publish" => "posts#undo_publish", as: :undo_publish

  end


  resources :referrals

  resources :needs ,:path =>  :requirements
  resources :donors do
    get :search, on: :collection
  end

  root to: 'home#index'
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :home
  resources :omniauth_links
  match '/auth/:provider/callback' ,to: 'authentication#create', via: [:get, :post]
  match '/auth/failure' ,to:'authentication#auth_failure' ,via: [:get, :post]
  # match 'donors' ,to:'home#donors', via: [:get, :post]
  match 'about' ,to:'home#about', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'vision' ,to:'home#vision', via: [:get]
  resources :contacts
end
