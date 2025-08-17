Rails.application.routes.draw do
  resources :todos, only: [ :index, :create, :update, :destroy ]
  get "/brag", to: "brag#show"
  root "todos#index"
end
