Boken::Application.routes.draw do
  devise_for :users
  resources :stories do
    resources :scenes, shallow: true
    get 'play', on: :member
  end
  resources :games do
    resources :commands, only: [:index, :new, :create]
  end
  root 'stories#index'
end
