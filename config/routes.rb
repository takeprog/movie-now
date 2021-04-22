Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  root to: "movies#index"
  resources :movies do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
