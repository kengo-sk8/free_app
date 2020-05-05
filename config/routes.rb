Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'profile/:id', to: 'users/registrations#edit_profile', as: 'edit_profile'                  #プロフィール変更ページ
    patch 'profile/:id', to: 'users/registrations#update_profile', as: 'update_profile'
    get 'phone/:id', to: 'users/registrations#edit_phone', as: 'edit_phone'                        #電話番号変更ページ
    patch 'phone/:id', to: 'users/registrations#update_phone', as: 'update_phone'
    get 'introduce/:id', to: 'users/registrations#edit_introduce', as: 'edit_introduce'            #本人情報変更ページ
    patch 'introduce/:id', to: 'users/registrations#update_introduce', as: 'update_introduce'

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
  
  resources :cards, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'cards#delete'     #クレカ削除アクション
      post 'show'                           #登録クレカ確認ページ
    end
    member do
      get 'confirmation'                    #クレカ追加ページ
    end
  end 
  
  root 'items#index'
  resources :items do   
  end  

end
