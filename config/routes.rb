Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders, only: [:index, :create, :show, :update]
      resources :items, only: [:index]
    end
  end

  match '*unmatched', to: 'application#route_not_found', via: :all, constraints: lambda { |req|
    req.path.exclude? '/rails/active_storage'
  }
end
