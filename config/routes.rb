Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'csv', to: 'books#get_csv'

  root 'home#index'
  resources :books, only: [:index,:create, :update, :destroy]
  resources :users, only: [:new,:create]
end
