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
    if item.destroy
      render :destory
    else
      redirect_to item_path(@item.id)
    end
  end
    
  def edit
    @parents = Category.all.order("id ASC").limit(607)
  end

  def update
    @parents = Category.all.order("id ASC").limit(607)
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
    # if params[:item][:images_attributes] && @item.update(item_params)
    #   redirect_to item_path(@item.id)
    # else
    #   # render :edit
    #   flash[:alert] = '商品情報を正しく入力してください'
    #   redirect_to edit_item_path
    # end
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
    params.require(:item).permit(:name, :content, :category_id, :size_id, :brand, :condition_id, :delivery_fee_id, :delivery_way_id,  :prefecture_id, :delivery_date_id, :price, images_attributes: [:src, :_destroy, :id])
  end  

  # def edit_item_params 
  #   params.require(:item).permit(:name, :content, :category_id, :size_id, :brand, :condition_id, :delivery_fee_id, :delivery_way_id, :prefecture_id, :delivery_date_id, :price, [images_attributes: [:src, :_destroy, :id]])
  # end


  def set_product
    @item = Item.find(params[:id])
  end

end