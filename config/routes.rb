Rails.application.routes.draw do
  get 'static_pages/about'
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get "/products/own_products", to: "products#own_products", as: :own_products
  resources :products do
    resources :reviews, only: [:create, :show]
    resources :renting_requests, only: :create
  end
    resources :reviews, only: [:destroy]

  resources :renting_requests, only: [:index, :update]

  # namespace :owner do
  #   resources :renting_requests, only: [:index, :update]
  # end
end
