Rails.application.routes.draw do
  devise_for :users
  root "movies#index"

  resources :movies, param: :slug do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
