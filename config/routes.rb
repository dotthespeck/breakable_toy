Rails.application.routes.draw do
  root 'conversations#index'

  devise_for :users

  resources :conversations, only: [:index]

  resources :messages, only: [:index, :new, :create]

end
