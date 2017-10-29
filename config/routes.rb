Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

  namespace :api do
    namespace :v1 do
      resources :destinations, only: ["show", "create", "update", "destroy", "index"]
    end
  end

end
