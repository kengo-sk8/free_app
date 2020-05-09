json.text  @comment.text
json.id  @comment.id
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
# json.user_image  @comment.user.user_image.url
json.created_at  @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.item_id  @item.id