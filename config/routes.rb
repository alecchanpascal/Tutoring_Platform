Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index]
  resources :enrollments, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "welcome#new"

  # namespace :tutor_admin do
  #   resources :dashboard, only: [:index, :edit, :destroy]
  # end

  # namespace :admin do
  #   resources :dashboard, only: [:index, :edit, :destroy]
  # end

end
