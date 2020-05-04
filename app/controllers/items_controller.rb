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
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  private
  def item_params
    params.require(:item).permit(:name, :content,:category,:brand, :condition_id, :delivery_fee_id, :delivery_way_id, :prefecture_code, :prefecture_id, :delivery_date_id, :price,images_attributes: [:src])
  end  


end