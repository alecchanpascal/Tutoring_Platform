Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  resources :enrollments, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "welcome#new"
  # get "/admin/:id/edit" => "admin#edit", as: :admin_edit
  # delete "/admin/:id" => "admin#destroy", as: :admin_destroy
  # get "/admins" => "admin#index"
  
  # post "/admin/:id/update" => "admin#update", as: :admin_update

  namespace :dashboard do
    resources :admin
  end

  
end
