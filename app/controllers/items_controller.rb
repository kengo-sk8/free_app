class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_code, :content, :upper_category_id, :middle_category_id, :lower_category_id, :size_id, :brand_id, :delivery_burden_id, :delivery_date_id, :delivery_method_id, :status_id, :condition_id, :purchase_status, item_images_attributes: [:id, :image])
  end

end