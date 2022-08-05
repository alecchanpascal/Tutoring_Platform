Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :lessons, only: [:new, :create, :destroy, :edit, :update, :index, :show]
  resources :enrollments, only: [:new, :create, :destroy, :update]
  resources :users do 
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end
  root "welcome#new"
  # delete '/dashboard/admin/:id' => "admin#destroy", as: :admin_destroy

  namespace :dashboard do
    resources :admin
  end

  resources :button, only: [:index] do
    resources :click, only: [:create]
  end
  # namespace :tutor_admin do
  #   resources :dashboard, only: [:index, :edit, :destroy]
  # end

  
end
