Rails.application.routes.draw do
  devise_for :users
  resources :posts

  get  '/profile/:id', to: 'users#show', as: 'profile'
  get  '/search/', to: 'users#index', as: 'index'
  root 'posts#index'
end
