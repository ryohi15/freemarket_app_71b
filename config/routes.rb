Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index"
  resources :users, only: :show 
  resources :items, only: :index do
    resources :images, only: :create
  end
end
