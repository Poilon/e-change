Rails.application.routes.draw do
  devise_for :users

  resources :jobs
  resources :feedbacks
  resource :dashboard

  root 'homes#show'
end
