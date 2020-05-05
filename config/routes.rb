Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :users, only: [:show, :create, :new, :destroy,:update] do
    member do
      get 'card'          #クレカ追加ページ
      get 'address'       #住所変更ページ
      get 'like'          #いいね一覧ページ
      get 'now'           #出品中
      get 'buyed'         #売却済み
      get 'nowbuy'        #取引中
      get 'mybuy'         #購入した商品
      get 'mybuyed'       #過去に購入した商品
    end
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'    #ログアウト確認ページ
      get 'deletion'
      get 'support'
    end
  end

  root 'items#index'
  resources :items do   
    collection do
      get 'items/new/mid_category', to: 'items#mid_category'
      get 'items/new/small_category', to: 'items#small_category'
    end
  end  
end


