Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  get 'contents/index'
  get 'topics/index'

  resources :topics, only: [:index, :new, :show, :create] do
    resources :posts, only: [:create, :edit, :update]
  end

end
