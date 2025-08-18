Rails.application.routes.draw do
 resources :todos, only: [ :index, :create, :update, :destroy ] do
  post :toggle, on: :member
end
  get "/brag", to: "brag#show"
  root "todos#index"
end
