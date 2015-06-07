Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :school_districts, only: [:new, :create, :show, :edit, :update]
end
