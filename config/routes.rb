Rails.application.routes.draw do
  root to: 'visitors#index'
  # get "/about/" => "visitors#about"
  devise_for :users
  resources :users
end
