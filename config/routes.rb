Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :friendships
  resources :friend_requests
  resources :comments
  
  get  '/profile/:id', to: 'users#show', as: 'profile'
  patch  '/profile/:id', to: 'users#update', as: 'user'
  get  '/search/', to: 'users#index', as: 'index'
  root 'posts#index'
end
