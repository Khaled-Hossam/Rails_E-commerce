Rails.application.routes.draw do
  resources :stores
  get 'home/index'
  resources :brands
  resources :categories
  devise_for :users

  root 'home#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
