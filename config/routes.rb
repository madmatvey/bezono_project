Rails.application.routes.draw do
  resources :organization_accounts
  resources :organization_profiles
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :users
end
