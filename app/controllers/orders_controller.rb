class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item_instance
  before_action :move_to_index

  def index
    @register_information = RegisterInformation.new
  end

  def create
    @register_information = RegisterInformation.new(order_params)
    if @register_information.valid?
      pay_item
      @register_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def find_item_instance
    @item = Item.find(params[:item_id])
  end

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end
end