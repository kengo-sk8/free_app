class SignupsController < ApplicationController
  def index
  end

  def registration
    binding.pry
    @user = User.new
    @user.build_addresses #userモデルとaddressesモデルの関連付け。
  end

  def registration_save #
    session[:user_params] = user_params
    session[:addresses_attributes_after_registration] = user_params[:addresses_attributes]
    @user = User.new(session[:addresses_attributes_after_registration])
    @user.build_addresses
    render '/signups/registration' unless @user.valid?
  end

  def address
    @user = User.new
    @user.build_addresses
  end

  def address_save #
    binding.pry
    session[:addresses_attributes_after_address] = user_params
    session[:addresses_attributes_after_adrdress].merge!(session[:addresses_attributes_after_registration])
    @user = User.new
    @user.build_addresses(session[:addresses_attributes_after_address])
    render '/signups/address' unless @user.valid?
  end

  def create 
    # binding.pry
    @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_addresses(session[:addresses_attributes_after_registration])  # ここでaddressesモデルのsessionを引数で渡す。
    @user.build_addresses(user_params[:addresses_attributes])  # 今回のビューで入力された情報を代入。
    # binding.pry
    if @user.save!
      session[:id] = @user.id  # ここでidをsessionに入れることでログイン状態に持っていける。
      redirect_to done_signups_path
    else
      render '/signups/address'
    end
  
    def show
    end
  
  end

  # def credit_card
  # end

  # def pay #payjpとCardのデータベース作成を実施します。
  #   if params['payjp-token'].blank?
  #     redirect_to action: 'new'
  #   else
  #     customer = Payjp::Customer.create(
  #     card: params['payjp-token']
  #     )
  #     @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
  #     if @card.save
  #       redirect_to action: 'done'
  #     else
  #       redirect_to action: 'pay'
  #     end
  #   end
  # end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def user_params
    params.permit(
      :nickname,
      :phone_number,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birthday_year_id,
      :birthday_moom_id,
      :birthday_day_id,
      addresses_attributes: [:id,:postal_code,:prefecture_code,:city_name,:street,]
      )
  end
end
