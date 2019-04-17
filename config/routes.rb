Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      get "/search", to: "search#show", as: "search"
      resources :favorites, only: [:index, :create]
      delete "/favorites", to: "favorites#destroy"
      resources :users, only: [:create]
    end
  end
end
