Rails.application.routes.draw do
  get 'reservations', to: "reservations#index"
  get 'reservations/new', to: 'reservations#new'
  get 'reservations/:id', to: "reservations#show"
  post 'reservations', to: "reservations#create"

#   get 'reservations/update'
#   get 'reservations/delete'
  devise_for :users
  root to: 'pages#home'
    resources :artists do
    resources :reservations
end
end
