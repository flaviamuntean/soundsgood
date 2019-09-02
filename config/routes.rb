Rails.application.routes.draw do
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show] do
    resources :videos, only: [:create]
    resources :audios, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
