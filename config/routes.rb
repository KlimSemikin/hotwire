Rails.application.routes.draw do
  namespace :api do
    resources :images, only: :update
  end

  resources :folders

  resources :notes, except: %i[show destroy] do
    collection do
      patch 'reorder'
    end
  end

  root 'images#index'
end
