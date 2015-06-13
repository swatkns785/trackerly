Rails.application.routes.draw do
  root 'school_districts#index'
  devise_for :users,
             :controllers => { registrations: "my_devise/registrations"}

  resources :school_districts, only: [:new, :create, :show, :edit, :update, :index] do
    resources :schools, only: [:new, :create, :index, :show, :edit, :update]
  end

  resources :school_district_invites
end
