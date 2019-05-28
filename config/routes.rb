Rails.application.routes.draw do
<<<<<<< HEAD
  get 'reservations', to: "reservations#index"
  get 'reservations/new', to: 'reservations#new'
  get 'reservations/:id', to: "reservations#show"
  post 'reservations', to: "reservations#create"

  get 'reservations/update'
  get 'reservations/delete'
  devise_for :users
  root to: 'pages#home'
    resources :artists do
    resources :reservations
  end
=======
 get 'reservations', to: "reservations#index"
 get 'reservations/new', to: 'reservations#new'
 get 'reservations/:id', to: "reservations#show"
 post 'reservations', to: "reservations#create"
 get 'reservations/update'
 get 'reservations/delete'
 devise_for :users
 root to: 'pages#home'
  resources :users
  resources :artists do
  resources :reservations
 end
>>>>>>> e4784dfb06dd57ca94961186299b175800f560c0
end
