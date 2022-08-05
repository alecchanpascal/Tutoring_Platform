Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :enrollments, only: [:new, :create, :destroy]
  resources :users
  root "welcome#new"
  resources "lessons" 
  resources "lessons" do
    resource :review, only: [:edit, :update,:destroy]
  end
  # namespace :tutor_admin do
  #   resources :dashboard, only: [:index, :edit, :destroy]
  # end

end
