Rails.application.routes.draw do
  root 'school_districts#index'
  devise_for :users,
             :controllers => { registrations: "my_devise/registrations"}

  resources :school_districts do
    resources :schools, only: [:new, :create, :index, :show, :edit, :update]
    resources :school_faculty_memberships, only: [:index, :new, :create]
  end

  resources :school_district_invites
end
