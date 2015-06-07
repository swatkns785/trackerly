Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

   resources :school_districts, only: [:new, :create, :show, :edit, :update] do
    resources :schools, only: [:new, :create, :index, :show]
  end

  resources :schools, only: :show
end
