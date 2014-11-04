Rails.application.routes.draw do
  devise_for :users

  resources :jobs

  resource :dashboard

  root 'homes#show'
end
