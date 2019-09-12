Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'videos/create'
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticated :user do
    root to: "users#index"
  end
  root to: 'pages#home'

  get '/home', to: 'users#index', as: :home
  # show page for user allowing creation of videos and audio files
  resources :users, only: [:show] do
    resources :videos, only: [:create, :destroy]
    resources :audios, only: [:create]
    resources :photos, only: [:create, :destroy]
  end

  # show page for user with audio, bio and influences routes
  resources :users do
    member do
      get 'audio'
      get 'bio'
      get 'influences'
      get 'add-to-playlist', as: :add_to_playlist
      patch 'update-instrument', to: "users#update_instrument", as: :update_instrument
      patch 'update-genre', to: "users#update_genre", as: :update_genre
      patch 'update_profile', to: "users#update_profile", as: :update_profile
      patch 'unlink-spotify', to: "users#unlink_spotify", as: :unlink_spotify
    end
  end

  resources :favorite_users, only: [:create, :destroy]
  resources :notifications, only: [:destroy] 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations do
    resources :messages
  end

  mount ActionCable.server => "/cable"

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
