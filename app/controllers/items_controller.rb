class ItemsController < ApplicationController
  # before_action :set_product, except: [:index, :new, :create]

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
    params.require(:item).permit(:name, :content,:category,:brand,:deliveryburden,:price,:status, :prefecture_code, :deliverydate, images_attributes: [:src])
  end  

  # def set_product
  #   @item = Item.find(params[:id])
  # end


end