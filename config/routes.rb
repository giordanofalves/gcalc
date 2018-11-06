Rails.application.routes.draw do
  root to: "calculations#new"
  resources :calculations, only: :new

  namespace :api do
    namespace :v1 do
      resources :calculations, only: :create
    end
  end
end
