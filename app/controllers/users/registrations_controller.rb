class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]


  def new
    @user = User.new
  end
 
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session["devise.regist_data"][:user]["password_confirmation"] = params[:user][:password_confirmation]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    if @user.save
      session["devise.regist_data"]["user"].clear
      sign_in(:user, @user)
    else
      render :new
    end
  end


  def edit_profile
    @profile = User.find(params[:id])
  end

  def update_profile
    @profile = User.find(params[:id])
    if @profile.update(account_update_params)
      sign_in(:user, @profile)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = @profile.errors.full_messages
      render :edit_profile
    end
  end

  def edit_phone
    @phone = User.find(params[:id])
  end

  def update_phone
    @phone = User.find(params[:id])
    if @phone.update(account_update_params)
      sign_in(:user, @phone)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = @phone.errors.full_messages
      render :edit_phone
    end
  end
  
  def edit_introduce
    @introduce = User.find(params[:id])
  end

  def update_introduce
    @introduce = User.find(params[:id])
    if @introduce.update(account_update_params)
      sign_in(:user, @introduce)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = @introduce.errors.full_messages
      render :edit_introduce
    end
  end

  def destroy
    if @user.destroy
      redirect_to deletion_users_path
    else
      flash[:notice] = 'アカウント削除できませんでした'
      redirect_to signout_users_path(current_user.id)
    end
  end

# < 編集後 ユーザーページへ >
  def after_update_path_for(resource)
    user_path(resource)
  end


protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number, :birthday_year_id, :birthday_moon_id, :birthday_day_id, :self_introduce ])
  end


  def address_params
    params.require(:address).permit(:postal_code, :prefecture_code, :city_name, :street, :street2)
  end
end
