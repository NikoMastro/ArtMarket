Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/products/own_products", to: "products#own_products", as: :own_products
  resources :products do
    resources :reviews, only: [:create, :show]
    resources :renting_requests, only: :create
  end

  resources :renting_requests, only: [:index, :update]

  # namespace :owner do
  #   resources :renting_requests, only: [:index, :update]
  # end
end
