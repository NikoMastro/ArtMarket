Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :reviews, only: [:create, :show, :update]
    resources :renting_requests, only: :create
  end
    resources :reviews, only: [:destroy]

  resources :renting_requests, only: [:index, :update]

  # namespace :owner do
  #   resources :renting_requests, only: [:index, :update]
  # end
end
