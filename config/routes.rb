Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'

  resources :cuisines,    only: [:index, :new, :create, :show, :edit, :update]
  resources :dishes,      only: [:index, :new, :create, :show, :edit, :update]
  resources :preferences, only: [:index, :new, :create, :show, :edit, :update]
  resources :recipes,     only: [:index, :new, :create, :show, :edit, :update]

end
