Rails.application.routes.draw do
  root 'rooms#index'

  devise_for :users

  resources :rooms, only: [:index]

  resources :messages, only: [:index, :new, :create]

end
