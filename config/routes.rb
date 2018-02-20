Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/verify', to: 'users/sessions#verify'
    post '/users/check_2fa', to: 'users/sessions#check_2fa'
  end
  resources :posts do
    resources :comments
  end
  resources :admin, only: [:index, :destroy]
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
