Rails.application.routes.draw do
  root "containers#index"
  get "/containers", to: "containers#index"
end
