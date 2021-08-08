Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'home#index'
  resources :books, only: [:index,:create, :update]
  resources :users, only: [:new,:create]
end
