Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :orders, only: [:create, :show]

  get 'notifications', to: 'notifications#index'
end
