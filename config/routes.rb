Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:index, :show, :new, :create]
end
