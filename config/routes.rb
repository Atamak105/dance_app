Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/show'
  devise_for :users
  root 'contents#index'
  get 'contents/index'

  resources :topics, only: [:index, :show, :create]
  

end
