Rails.application.routes.draw do
  get 'videos/create'
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get '/home', to: 'users#index', as: :home
  # show page for user allowing creation of videos and audio files
  resources :users, only: [:show] do
    resources :videos, only: [:create]
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
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
