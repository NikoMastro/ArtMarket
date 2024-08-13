Rails.application.routes.draw do
  root to: 'pages#home'
<<<<<<< HEAD
  resources :products do
=======
  resources :products, only: [:index, :show, :new, :create] do
>>>>>>> 0cb5df6e1f50b113b15c518a0bdf58bab27a9c85
    resources :reviews, only: :create
    resources :renting_requests, only: :create
  end

  resources :renting_requests, only: :index

  namespace :owner do
    resources :renting_requests, only: [:index, :update]
  end
end
