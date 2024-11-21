Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]
      resources :orders, only: [:create, :show]

      get 'notifications', to: 'notifications#index'
    end
  end
end
