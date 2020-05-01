class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @item.images.build

    # respond_to do |format|
    #   format.html
    #   format.json
  end

  def create
    Item.create(item_params)
    redirect_to root_path
    # if @item.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :content,:upper_category,:brand,:deliveryburden,:price,:status, :prefecture_code, :deliverydate, images_attributes: [:src])
  end   


end