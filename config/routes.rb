Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#new"
  
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  resources :enrollments, only: [:new, :create, :destroy, :update]
  resources :users do 
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end
  
  resources :notifications, only: [:destroy]
  
  namespace :dashboard do
    resources :admin
  end
end
