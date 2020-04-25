Rails.application.routes.draw do
  devise_for :users
  resources :signups, only: [:index] do
    collection do
      get 'registration'

    end
  end

  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
