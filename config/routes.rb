Rails.application.routes.draw do
  root 'conversations#index'
  
  devise_for :users

  resources :conversations

end
