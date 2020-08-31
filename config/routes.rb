Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'

  resources :contents, only: [:index]
  resources :messages, only: [:index]
  get 'contents/index'
  # root to: 'messages#index'

end
