Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :create] do
    resources :friendships
    resources :invitations
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
