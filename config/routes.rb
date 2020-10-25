Rails.application.routes.draw do
  root 'containers#index'

  resources :containers, only: [:index] do
    collection do
      get :search
    end
  end

  resources :master_datas, only: [:index]
end
