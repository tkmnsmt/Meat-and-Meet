Rails.application.routes.draw do
  root "posts#index"
  post '/' => 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :posts, only: [:index, :create, :show, :update, :destroy] do
    resources :likes, only: [:index, :create, :destroy]
  end
  get "likes/liked_posts/:id" => "likes#liked_posts"
  resources :users, only: [:show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:index, :create, :show, :index]
  # resources :searches, only: [:index]
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
