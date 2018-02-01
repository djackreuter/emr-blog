Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts do
    resources :comments
  end
  resources :admin, only: [:index, :destroy]
end
