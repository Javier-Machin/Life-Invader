Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :friendships
  resources :friend_requests
  
  get  '/profile/:id', to: 'users#show', as: 'profile'
  get  '/search/', to: 'users#index', as: 'index'
  root 'posts#index'
end
