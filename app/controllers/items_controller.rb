class ItemsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy, :purchase, :pay, :done]
  before_action :set_card, only: [:purchase, :pay, :done]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
    #.images.buildで@itemに画像のデータを追加で格納している
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :create
      # 出品画面で必須項目に全ての値が入力された際、保存がされてcreate画面に移動する
    else
      @image = @item.images.build
      render :new
      # else以下の記述の意味
      # 入力必須コマンドに値が格納されていない状態で出品してしまった場合、再度出品画面に遷移した際、画像の選択画面が消え画像挿入できなくなる。（必須 image = @item.images.build）
    end
  end

  def destroy
    if @item.destroy
      render :destory
    else
      redirect_to item_path(@item.id)
    end
  end
    
  # def edit
  #   @parents = Category.all.order("id ASC").limit(607)
  #   # カテゴリーに保存されているデータを出力する為、記述した。
  # end

  # def update
  #   @parents = Category.all.order("id ASC").limit(607)
  #   # カテゴリーに保存されているデータを出力する為、記述した。
  #   if params[:item][:images_attributes] && @item.update(item_params)
  #     redirect_to item_path(@item.id)
  #   else
  #     flash[:alert] = '商品情報を正しく入力してください'
  #    redirect_to edit_item_path
  #   end
  # end

  def show
    @parents = Category.order("id ASC").limit(607)
    # カテゴリーに保存されているデータを出力する為、記述した。
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = Category.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

  #< 商品購入アクション purchase、pay、done>
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
      redirect_to done_items_path(@item.id)
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
    # images_attributes: [:src, :_destroy, :id]の意味を下記に記載
    # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る。これにより、itemとimageを紐つけしている。
    # ○○は関連付く側のモデルの名前(今回はimage)、××にはフォーム(今回は画像のカラム名は、src)に対応するカラムの名前が入る。
  end  

  def set_product
    @item = Item.find(params[:id])
    # :edit, :update, :showにitem.idを与える必要がある為、記述した
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end