Rails.application.routes.draw do
  devise_for :users
  root "movies#index"

  resources :movies do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
