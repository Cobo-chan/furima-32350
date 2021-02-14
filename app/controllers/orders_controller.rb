class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @register_information = RegisterInformation.new
  end

  def create
    @register_information = RegisterInformation.new(order_params)
    if @register_information.valid?
      pay_item
      @register_information.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.require(:register_information).permit(
      :postcode,
      :prefecture_id,
      :municipality,
      :address,
      :optional_address,
      :phone_number)
      .merge(token: params[:token],
      user_id: current_user.id,
      item_id: params[:item_id])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
