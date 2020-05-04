class ItemsController < ApplicationController
  # before_action :set_product, except: [:index, :new, :create]

  def index
    
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :create
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item .destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :content,:category,:brand, :condition_id, :delivery_fee_id, :delivery_way_id, :prefecture_code, :prefecture_id, :delivery_date_id, :price,images_attributes: [:src])
  end  


end