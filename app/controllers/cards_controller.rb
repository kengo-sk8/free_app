class CardsController < ApplicationController
  before_action :get_payjp_info, only: [:new_create, :create,:delete, :show]
  before_action :set_card, only: [:delete, :show]

  def edit
  end

  def confirmation
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  def show
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "ms.png"
      when "American Express"
        @card_src = "ame.png"
      when "Diners Club"
        @card_src = "dc.png"
      when "Discover"
        @card_src = "dis.png"
      when "Discover"
        @card_src = "dis.png"
      end
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def delete
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "confirmation", id: current_user.id
  end

  private
  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end

