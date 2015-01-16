Rails.application.routes.draw do
  root 'conversations#index'

  devise_for :users

  resources :conversations do

    resources :messages, only: [:new, :create, :edit, :update, :destroy]
  end

end
