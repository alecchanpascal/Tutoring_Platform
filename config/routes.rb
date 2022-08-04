Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :edit_password, :update] do
    resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index]
  end
  root "welcome#new"
end
