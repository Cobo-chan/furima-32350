class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipment_charge_id, :prefecture_id, :derivery_date_id, :selling_price).merge(user_id: current_user.id)
  end
end
