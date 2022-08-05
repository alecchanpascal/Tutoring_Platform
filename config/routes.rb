Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  resources :enrollments, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "welcome#new"
  resource :review, only: [:edit, :update,:destroy]

  namespace :dashboard do
    resources :admin
  end
  # namespace :tutor_admin do
  #   resources :dashboard, only: [:index, :edit, :destroy]
  # end

  
end
