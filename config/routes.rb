Community::Application.routes.draw do

  scope '/api' do
    scope '/v1' do
      scope '/donors' do
        get '/' => 'api/donors#index'
        post '/search' => 'api/donors#search'
      end
    end
  end

  resources :subscribers do
    collection do
      post 'subscription_message'
      post 'unsubscribe'
      get 'unsubscribe_sms'
    end
  end

  match 'icc-world-cup-live-update' ,to:'subscribers#index', via: [:get] ,as: :live_update

  resources :organizations do
    collection do
      get :my_organization, as: 'my'
      get :display
      post :join
      post :remove
      get :filter
    end
  end

  resources :states, only: [] do
    collection do
      get :get_districts
    end
  end

  resources :dashboards, only: :index

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




=begin
Unique organization name,
organizations profile picture,
complete address,
a 255 char description.
=end
