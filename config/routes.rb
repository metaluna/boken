Boken::Application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :stories do
    resources :scenes, shallow: true
  end
  resources :games do
    resources :commands, only: [:index, :new, :create]
  end
  root 'stories#index'
end
