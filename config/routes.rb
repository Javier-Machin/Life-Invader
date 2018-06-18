Rails.application.routes.draw do
  devise_for :users
  resources :posts

  get  '/profile/:id', to: 'users#show', as: 'profile'
  root 'posts#index'
end
