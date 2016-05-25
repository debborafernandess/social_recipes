Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes, only: [:index, :new, :create, :show, :edit, :update]
  resources :cuisines, only: [:index, :new, :create, :show]
  resources :dishes, only: [:index, :new, :create, :show, :edit, :update]
end
