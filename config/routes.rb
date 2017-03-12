Rails.application.routes.draw do
  resources :voices

  devise_for :users

  root to: 'voices#index'
end
