Rails.application.routes.draw do
  mount Filepond::Rails::Engine, at: '/filepond'

  resources :posts

  devise_for :users

  # Restrict registrations to admins ONLY
  constraints lambda { |req| req.env['warden'].user&.admin? } do
      devise_scope :user do
          get "/sign_up", to: "users/registrations#new" # Removed "/users"
          post "/sign_up", to: "users/registrations#create" # Removed "/users"
      end
  end

  # Defines the root path route ("/")
  root "home#index"

  post "toggle_like", to: "likes#toggle_like", as: "toggle_like"
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show, :index]

  post "follow", to: 'follows#follow', as: :follow
  delete 'unfollow', to: 'follows#unfollow', as: :unfollow
  delete 'cancel_request', to: 'follows#cancel_request', as: :cancel_request

  post 'accept_follow', to: 'follows#accept_follow', as: :accept_follow
  delete 'decline_follow', to: 'follows#decline_follow', as: :decline_follow

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
