Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    member do
      get :following, :followers, :favorites
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :chords, only: [:index, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
end
