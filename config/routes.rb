Community::Application.routes.draw do
  get 'users/index'

  get 'otp/new', to: 'otp#new', as: :otp_new
  post 'otp/send_otp', to: 'otp#send_otp'  # Sends OTP to the user
  post '/verify_otp', to: 'otp#verify', as: 'verify_otp' # Verifies the OTP



  get 'register' => 'event_registrations#index'
  get 'event_dashboard' => 'event_registrations#event_dashboard'
  post 'save_attachment' => 'event_registrations#save_attachment'
  post 'save_video_link' => 'event_registrations#save_video_link'
  resources :event_registrations

  resources :colleges do
    collection { post :import }
  end

  use_doorkeeper

  scope '/api' do
    scope '/v1' do
      scope '/donors' do
        get '/' => 'api/donors#index'
        post '/' => 'api/donors#index'
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

  resources :referrals

  resources :needs ,:path =>  :requirements
  resources :donors do
    get :search, on: :collection
  end

  root to: 'home#index'
  # devise_for :users, controllers: { sessions: 'users/sessions'}
  #
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:index, :show, :edit, :update, :destroy, :create]

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