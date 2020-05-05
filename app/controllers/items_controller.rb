class ItemsController < ApplicationController
  before_action :set_product, only: [:edit, :show]

  def index
    @items = Item.all
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
      @image = @item.images.build
      render :new
    end
  end


  def destroy
    item = Item.find(params[:id])
    item .destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
    @parents = Category.all.order("id ASC").limit(607)
  end

  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = Category.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end


  private
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :size_id, :brand, :condition_id, :delivery_fee_id, :delivery_way_id, :prefecture_code, :prefecture_id, :delivery_date_id, :price,images_attributes: [:src])
  end  

  def set_product
    @item = Item.find(params[:id])
  end

end