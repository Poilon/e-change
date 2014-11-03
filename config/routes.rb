Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/search'


  get 'home/index'
  root 'home#index'
  resources :jobs

  devise_for :users
end
