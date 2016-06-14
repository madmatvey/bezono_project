Rails.application.routes.draw do
  
  resources :accreditations do
    resources :build, controller: 'accreditations/build'
  end
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :organization_accounts
  resources :organization_profiles
  root to: 'visitors#index'
  resources :users
end
