Rails.application.routes.draw do
  root to: 'pages#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :userparams, except:[:index]

  resources :products do
    resources :likes,only: [:create,:destroy]
    resources :comments, except:[:new,:edit,:show,:index]
    #resources :comments
  end

  resources :comments, except:[:new,:edit,:show,:index]

  get 'categories/:category', to: 'products#index', as: :category
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
