Rails.application.routes.draw do

  resources :competences do
    member do
      get :organization_profiles
    end
  end
  put '/user_notif/:id', to: 'user_notif/notifs#read', as: :read_user_notif
  resources :demands, shallow: true do
    resources :explanations #, except: [:index]
  end

  resources :criterions

  resources :accreditations do
    resources :build, controller: 'accreditations/build'
  end
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :organization_accounts
  resources :proofs, only: [:show, :create, :update, :destroy]
  resources :organization_profiles do
    member do
      get :competences
    end
  end
  root to: 'visitors#index'
  resources :users

  mount ActionCable.server => '/cable'
end
