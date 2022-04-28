Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    member do
      get :following, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  # resources :relationships, only: [:create, :destroy]

  resources :chords, only: [:index, :new, :create, :destroy]
end
