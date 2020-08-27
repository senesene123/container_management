Rails.application.routes.draw do
  root 'containers#index'

  resources :containers, only: [:index] do
    collection do
      get :search
    end
  end
end
