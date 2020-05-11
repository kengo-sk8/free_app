class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(use_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def card
  end

  def address
    @address = Address.find(params[:id])
  end

  def update
    params[:user] == nil
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = @address.errors.full_messages
      render :address
    end
  end


  def deletion
  end

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(10)
  end

  def now
    @user = User.find_by(id: params[:id])
    @item = Item.where(user_id: @user.id).page(params[:page]).per(10)
  end

  def buyed
    @user = User.find_by(id: params[:id])
    @item = Item.where(user_id: @user.id).page(params[:page]).per(10)
  end

  def nowbuy
    @user = User.find_by(id: params[:id])
    @item = Item.where(user_id: @user.id).page(params[:page]).per(10)
  end

  def mybuy
    @user = User.find_by(id: params[:id])
    @item = Item.where(buyer_id: @user.id).page(params[:page]).per(10)
  end

  def mybuyed
    @user = User.find_by(id: params[:id])
    @item = Item.where(buyer_id: @user.id).page(params[:page]).per(10)
  end

  def support
  end

  private 
  def user_params 
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name,:first_name_kana, :last_name_kana, :introduction, :birthday_year_id, :birthday_moon_id, :birthday_day_id, :phone_number)
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_code, :city_name, :street)
  end
end
