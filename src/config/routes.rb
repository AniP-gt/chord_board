Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get :following, on: :member
    get :followers, on: :member
  end
  resources :chords ,only: [ :index, :new]
end
