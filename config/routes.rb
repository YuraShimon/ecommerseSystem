Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: 'pages#index'
  resources :userparams

  get 'categories/:category', to: 'products#index', as: :category
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
