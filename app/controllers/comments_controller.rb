class CommentsController < ApplicationController
  before_action :set_instance

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to item_path(params[:item_id])  }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to item_path(@item.id)
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_instance
    @item = Item.find(params[:item_id])
  end
end
