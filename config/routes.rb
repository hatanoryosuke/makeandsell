Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :create, :show, :edit, :update,:destroy]do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:edit, :update, :show]
  resources :genres, only: [:new, :create, :edit, :update]


end
