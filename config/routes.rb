Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :artists do
    collection do
      get :index_manager
    end

  resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :index_manager
    end
  end
end
