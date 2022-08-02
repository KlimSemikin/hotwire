Rails.application.routes.draw do
  namespace :api do
    resources :images, only: :update
  end

  resources :folders

  resources :notes, except: %i[show destroy]

  root 'images#index'
end
