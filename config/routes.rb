Rails.application.routes.draw do
  root 'pages#index'
  resources :pages, only: [:index]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
