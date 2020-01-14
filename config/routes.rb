Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :create, :show, :edit, :update,:destroy]do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show]do
  end
  resources :genres, only: [:new, :create, :edit, :update]


end
