Rails.application.routes.draw do

  put '/user_notif/:id', to: 'user_notif/notifs#read', as: :read_user_notif
  resources :demands, shallow: true do
    resources :explanations #, except: [:index]
  end

  resources :accreditations do
    resources :build, controller: 'accreditations/build'
  end
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :organization_accounts
  resources :organization_profiles
  root to: 'visitors#index'
  resources :users
end
