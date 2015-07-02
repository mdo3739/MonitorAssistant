Rails.application.routes.draw do
  resources :events
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
  resources :applications
end
