Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :posts, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:show]
  # resources :searches, only: [:index]
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
