Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  resources :enrollments, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "welcome#new"
  get "/admin" => "admin#index"

  namespace :admin do
    resources :dashboard, only: [:edit, :destroy]
  end

  
end
