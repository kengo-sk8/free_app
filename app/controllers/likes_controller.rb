class LikesController < ApplicationController
  before_action :set_variables

  def like
    #Userモデルの呼び出しをcurrent_userで行う。これにより、自動的にuser_idにcurrent_user.idが指定される。
    like = current_user.likes.new(item_id: @item.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
    # @id_nameは非同期の時に使う
  end

end
