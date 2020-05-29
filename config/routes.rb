Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :posts, only: [:index, :show, :new, :create, :destroy]
  post 'users/logout', to: 'users#logout'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  post 'posts/:id/classify', to: 'posts#classify', as: "classify"
end
