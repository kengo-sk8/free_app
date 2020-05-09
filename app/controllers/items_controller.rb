class ItemsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy, :purchase, :pay, :done]

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
    if @item.destroy
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
    if params[:item][:images_attributes] && @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      flash[:alert] = '商品情報を正しく入力してください'
     redirect_to edit_item_path
    end
  end

  # def show
  #   @parents = Category.all.order("id ASC").limit(607)
  # end

  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = Category.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

# < 商品購入アクション purchase、pay、done>
def purchase
  if @card.blank?
    flash.now[:alert] = 'カードを登録してください。'
  else
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end
end

def pay
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  charge = Payjp::Charge.create(
  amount: @item.price,
  customer: @card.customer_id,
  card: params['payjp-token'],
  currency: 'jpy'
  )
  if @item.update( buyer_id: current_user.id)
    redirect_to done_products_path(@item.id)
  else
    redirect_back(fallback_location: root_path)
  end
end

def done
  Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #保管した顧客IDでpayjpから情報取得
  customer = Payjp::Customer.retrieve(@card.customer_id)
  #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
  @default_card_information = customer.cards.retrieve(@card.card_id)
end

  private
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :size_id, :brand, :condition_id, :delivery_fee_id, :delivery_way_id,  :prefecture_id, :delivery_date_id, :price, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end  

  def set_product
    @item = Item.find(params[:id])
  end

end