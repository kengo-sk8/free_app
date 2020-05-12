json.text  @comment.text
json.id  @comment.id
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.created_at  @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.item_id  @item.id

#jbuilder内の記述は、右から左に置き換えている。要は@comment.text(なんらかのtextデータ)をjson型のtextに置き換えている