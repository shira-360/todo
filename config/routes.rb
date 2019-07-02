Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :tasks do
    resources :comments
  end
  resources :users
  resources :tasksusers
  
end
