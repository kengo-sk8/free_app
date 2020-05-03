Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :signups, only: [:index] do
    collection do
      get 'registration'

    end
  end

  root 'items#index'
  resources :items do
  end  
end
