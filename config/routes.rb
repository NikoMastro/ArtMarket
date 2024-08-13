Rails.application.routes.draw do
  root to: 'pages#home'
  resources :products do
    resources :reviews, only: :create
    resources :renting_requests, only: :create
  end

  resources :renting_requests, only: :index

  namespace :owner do
    resources :renting_requests, only: [:index, :update]
  end
end
