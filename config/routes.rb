Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products do
    resources :likes,only: [:create,:destroy]
    resources :comments
  end
  devise_for :users
  root to: 'pages#index'
  resources :userparams

  get 'categories/:category', to: 'products#index', as: :category
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
