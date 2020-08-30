Rails.application.routes.draw do
  root 'pages#index'
  resources :pages, only: [:index] do
    collection do
      get :search
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :follows, only: [:create, :destroy]

    member do
      get :fans
      get :followings
    end
  end

  resources :posts do
    resources :comments, only: [:create]
  end
end
