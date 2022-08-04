Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index]
  resources :users, only: [:new, :create, :edit, :edit_password, :update] 
  root "welcome#new"
end
