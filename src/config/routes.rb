Rails.application.routes.draw do
  get 'chord/index'
  get 'chord/list'
  devise_for :users
  root to: "home#index"
  resources :users
end
