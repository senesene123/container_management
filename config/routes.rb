Rails.application.routes.draw do
  root 'containers#index'

  resources :containers, only: [:index] do
    collection do
      get :search
    end
  end

  namespace :dashboard do
    resources :vegetables, only: [:index, :create, :edit, :update, :destroy]
    resources :companies, only: [:index, :create, :edit, :update, :destroy]
  end
end
