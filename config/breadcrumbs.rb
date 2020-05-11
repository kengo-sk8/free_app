crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :card do
  link "支払い方法", card_user_path(current_user.id)
  parent :mypage
end

crumb :edit_card do
  link "クレジットカード情報", edit_card_path(current_user.id)
  parent :card
end


crumb :profile do
  link "プロフィール", edit_profile_path(current_user.id)
  parent :mypage
end

crumb :introduce do
  link "本人情報", edit_introduce_path(current_user.id)
  parent :mypage
end

crumb :address do
  link "発送元・お届け先の住所変更", address_user_path(current_user.id)
  parent :mypage
end

crumb :edit_mail do
  link "メール・パスワード", edit_user_registration_path(current_user.id)
  parent :mypage
end

crumb :phone do
  link "電話番号", edit_phone_path(current_user.id)
  parent :mypage
end

crumb :like do
  link "いいね一覧", like_user_path
  parent :mypage
end

crumb :nowbuy do
  link "取引中", nowbuy_user_path
  parent :mypage
end

crumb :mybuy do
  link "購入した商品取引中", mybuy_user_path
  parent :mypage
end

crumb :support do
  link "お問い合わせ", support_users_path
  parent :mypage
end

crumb :now do
  link "出品中", now_user_path
  parent :mypage
end

crumb :buyed do
  link "売却済み", buyed_user_path
  parent :mypage
end

crumb :sign do
  link "ログアウト", signout_users_path
  parent :mypage
end

crumb :show_product do
  link "商品詳細", product_path
  parent :root
end

crumb :list do
  link "商品一覧", products_list_products_path
  parent :root
end

crumb :search do
  link "検索結果", search_products_path
  parent :root
end