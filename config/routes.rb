Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
  resources :applications
  namespace :api do
    resources :events#, only: [:create]
  end
  match 'create_event', to: 'events#create', via: [:options]
end
