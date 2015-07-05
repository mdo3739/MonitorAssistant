Rails.application.routes.draw do
  resources :events, except: [:create]
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
  resources :applications
  namespace :api, defaults: {format: :json} do
    resources :events, only: [:create]
  end
end
