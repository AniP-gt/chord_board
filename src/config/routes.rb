Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :chords
  # get  'chords/index'
  # get  'chords/new'
end
